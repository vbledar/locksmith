package locksmith

import org.locksmith.category.Category
import org.locksmith.comms.InformationMessage
import org.locksmith.comms.UserMessage
import org.locksmith.exception.ServiceException
import org.locksmith.item.Item
import org.locksmith.location.Area
import org.locksmith.media.Photo

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class AdminController {

    // injection of category service
    def categoryService

    // injection of photo service
    def photoService

    // injection of item service
    def itemService

    // injection of communications service
    def communicationsService

    // render main administration page
    def index() {
        render (view: '/admin/administration')
    }

    // render parent categories administration page
    def parentCategories() {
        def parentCategories = categoryService.findParentCategories(params);
        render (view: '/admin/category/parentCategories', model: [parentCategories: parentCategories])
    }

    // render child categories administration page
    def childCategories() {
        def parentCategories = categoryService.findParentCategories(params);
        def childCategories = categoryService.findChildCategories(params, false)
        def totalChildCategories = categoryService.findChildCategories(params, true)
        render (view: '/admin/category/childCategories', model: [parentCategories: parentCategories,
                                                                 childCategories: childCategories,
                                                                 totalChildCategories: totalChildCategories])
    }

    // all items of a subcategory
    def categoryItems() {
        def parentCategories = categoryService.findParentCategories(params);
        def childCategories = categoryService.findChildCategories(params, false)

        def items = itemService.findItems(params, false)
        def itemsTotal = itemService.findItems(params, true)[0]

        render (view: '/admin/category/categoryItems', model: [parentCategories: parentCategories,
                                                               childCategories: childCategories,
                                                               items: items,
                                                               itemsTotal: itemsTotal])
    }

    // all areas defined
    def areas() {
        def areas = Area.allAreas
        render (view: '/admin/area/areas', model: [areas: areas])
    }

    // all information messages
    def communicationManagement() {
        def informationMessages = InformationMessage.findAll();
        def commentMessages = communicationsService.getLast10UserMessages();

        render ( view: 'comms/communicationAdministration', model: [informationMessages: informationMessages, commentMessages: commentMessages])
    }

    // create area and redirect to all areas action
    def createArea() {
        Area area = new Area()
        bindData(area, params)

        if (!area.save()) {
            area.errors.each {
                log.error it
            }
        }

        redirect (action: 'areas')
    }

    // delete area and redirect to all areas action
    def deleteArea() {
        Area area = Area.findById(params.areaId)
        if (area) {
            area.delete()
        }
        redirect (action: 'areas')
    }

    // render item view
    def showItem() {
        // retrieve related item
        Item item = Item.get(params.id)

        // if item not found redirect back with message
        if (!item) {
            flash.message = message(code: 'item.not.found', default: 'Το αντικείμενο δεν βρέθηκε.')
            redirect(action: 'categoryItems')
        }

        render (view: 'category/item', model: [item: item, parentCategories: Category.getParentCategories(), childCategories: item.category.children])
    }

    def updateItem() {
        log.error params

        //retrieve item
        Item item = Item.get(params.id)

        def parent = item.category.id
        def child = item.subcategory.id

        Category category = params.category ? Category.get(params.category) : item.category
        Category subcategory = params.subcategory ? Category.get(params.subcategory) : item.subcategory

        // if item not found redirect back with message
        if (!item) {
            flash.message = message(code: ' item.not.found', default: 'Το αντικείμενο δεν βρέθηκε.')
            redirect (action: 'categoryItems')
        }

        bindData (item, params)

        item.category = category
        item.subcategory = subcategory

        item.errors = null
        if (!item.save(flush: true)) {
            item.errors.each {
                log.error it
            }

            redirect(action: 'showItem', id: item?.id)
        }

        params.parent = parent
        params.child = child
        redirect( action: 'categoryItems', params: params)
    }

    def showItemPhoto() {
        // retrieve photo to render
        Photo photo = Photo.get(params.id)
        if (!photo) {
            log.error 'Photo not found!'
            return null
        }

        // find the item extension
        def extension = photo.filename.substring(photo.filename.lastIndexOf(".")+1)

        // render image to client
        def BufferedImage image = ImageIO.read(new File(grailsApplication.config.locksmith.uploaded.images.dir + photo.filename))
        response.setContentType("image/" + extension)
        ImageIO.write(image, extension, response.getOutputStream())
    }

    // render form entry for child categories (up to 100 entries will be returned)
    def ajaxRenderChildCategories() {
        // set by default max to 100 records
        params.max = '100'

        // get child categories
        def childCategories = categoryService.findChildCategories(params, false)

        // render child categories template
        render (template: '/admin/category/utils/childCategoriesList', model: [childCategories: childCategories])
    }

    // create a new category and render the result to client
    def ajaxCreateCategory() {

        // category to create
        Category category = new Category()

        // bind request parameters to instance object
        bindData(category, params)

        // proceed by persisting the instance
        try {
            if(categoryService.createOrUpdateCategory(category, params)) {
                render(contentType: 'application/json') {
                    ['success': true, 'message': 'Category created successfully.']
                }
                return;
            }
        } catch(Exception ex) {
            log.error('Failed to create category.', ex);
        }

        render (contentType: 'application/json') {
            ['success': false, 'message': 'Failed to create category.']
        }
    }

    // update category
    def ajaxUpdateCategory() {

        if (!params.id) {
            render(contentType: 'application/json') {
                ['success': false, 'message': 'Category id not found.']
            }
            return;
        }

        Category category = Category.get(params.getLong('id'));
        if (!category) {
            render(contentType: 'application/json') {
                ['success': false, 'message': 'Category not found by id [' + params.id + '].']
            }
            return;
        }

        // bind request parameters to instance object
        bindData(category, params)

        // proceed by persisting the instance
        try {
            if(categoryService.createOrUpdateCategory(category, params)) {
                render(contentType: 'application/json') {
                    ['success': true, 'message': 'Category updated successfully.']
                }
                return;
            }
        } catch(Exception ex) {
            log.error('Failed to update category.', ex);
        }

        render (contentType: 'application/json') {
            ['success': false, 'message': 'Failed to update category.']
        }
    }

    // delete requested category and render result to client
    def ajaxDeleteCategory() {

        // category to delete
        Category category = Category.get(params.getLong('categoryId'))

        // delete the category
        if (!categoryService.deleteCategory(category)) {
            render (contentType: 'application/json') {
                ['success': false, 'message': 'Failed to delete category.']
            }
            return
        }

        render(contentType: 'application/json') {
            ['success': true, 'message': 'Category was deleted successfully.']
        }
    }

    // create item action
    def ajaxCreateItem() {

        // create item instance and bind request parameters
        Item item = new Item()
        bindData(item, params)

        // persist item in database
        item = itemService.createItem(item, params)

        // create item photo records, transfer physical files and persist instance objects
        for (index in 0..3) {
            if (params['itemphoto'+index]) {
                // retrieve DiskFileItem from parameters
                def fileItem = params['itemphoto'+index]
                if (fileItem.empty) {
                    log.error('Provided file item is empty. No reason to proceed...')
                    continue
                }

                // transfer physical file
                if (!photoService.transferPhysicalFileLocally(fileItem)) {
                    log.error 'File transfer failure...'
                    // TODO remove previous files which were transferred successfully.
                    render (contentType: 'application/json') {
                        ['succes': false, 'message': 'Failed to upload item photo.']
                    }

                    throw new ServiceException()
                } else {
                    log.error 'File transfer successful...'

                    photoService.createItemPhotoRecord(item, fileItem)
                }
            }
        }

        render (template: 'category/itemEntry', model: [item: item])
    }

    // delete item action
    def ajaxDeleteItem() {
        // get item instnace to delete
        Item item = Item.get(params.itemId)


        if (item) {
            // delete item instance
            itemService.deleteItem(item)

            // render success message
            render (contentType: 'application/json') {
                ['success': true, 'message': 'Item deleted successfully.']
            }
        } else {
            // render failure message
            // item not found???
            render (contentType: 'application/json') {
                ['success': false, 'message': 'Item not found.']
            }
        }
    }

    // create information message
    def ajaxCreateInformationMessage() {
        log.error (params);

        // create item instance and bind request parameters
        InformationMessage informationMessage = new InformationMessage()
        bindData(informationMessage, params)

        // persist instance in database
        if (!informationMessage.save()) {
            informationMessage.errors.each {
                log.error it
            }

            render (contentType: 'application/json') {
                ['succes': false, 'message': 'Failed to create information message.']
            }
            return
        }


        // retrieve DiskFileItem from parameters
        def fileItem = params['itemphoto0']
        if (fileItem.empty) {
            log.error('Provided file item is empty. No reason to proceed...')
            render (contentType: 'application/json') {
                ['success': true, 'message': 'Failed to upload photo.']
            }
            return
        }

        // transfer physical file
        if (!photoService.transferPhysicalFileLocally(fileItem)) {
            log.error 'File transfer failure...'
            // TODO remove previous files which were transferred successfully.
            render (contentType: 'application/json') {
                ['succes': false, 'message': 'Failed to upload photo for message.']
            }

            throw new ServiceException()
        } else {
            log.error 'File transfer successful...'

            Photo photo = photoService.createPhotoRecord(fileItem);

            informationMessage.photo = photo

            // persist instance in database
            if (!informationMessage.save()) {
                informationMessage.errors.each {
                    log.error it
                }

                render (contentType: 'application/json') {
                    ['succes': false, 'message': 'Failed to attach photo in information message.']
                }

                throw new ServiceException()
            }

            render (template: 'comms/informationMessageEntry', model: [informationMessage: informationMessage])
        }
    }

    // delete item action
    def ajaxDeleteInformationMessage() {
        // get information message instnace to delete
        InformationMessage informationMessage = InformationMessage.get(params.informationMessageId)


        if (informationMessage) {
            // delete item instance
            communicationsService.deleteInformationMessage(informationMessage)

            // render success message
            render (contentType: 'application/json') {
                ['success': true, 'message': 'Information message deleted successfully.']
            }
        } else {
            // render failure message
            // item not found???
            render (contentType: 'application/json') {
                ['success': false, 'message': 'Information message not found.']
            }
        }
    }

    // delete comment action
    def ajaxDeleteCommentMessage() {
        // get information message instnace to delete
        UserMessage userMessage = UserMessage.get(params.commentMessageId)


        if (userMessage) {
            // delete item instance
            communicationsService.deleteUserMessage(userMessage)

            // render success message
            render (contentType: 'application/json') {
                ['success': true, 'message': 'Comment message deleted successfully.']
            }
        } else {
            // render failure message
            // item not found???
            render (contentType: 'application/json') {
                ['success': false, 'message': 'Comment message not found.']
            }
        }
    }
}
