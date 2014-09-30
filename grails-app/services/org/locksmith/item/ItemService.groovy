package org.locksmith.item

import org.locksmith.category.Category
import org.locksmith.exception.ServiceException

class ItemService {

    // injection of photo service
    def photoService

    /**
     * Create item. From the params the parent and sub categories are
     * first found in database then they are related to the item.
     *
     * The created item is returned to the caller.
     *
     * @param item the item instance to persist
     * @param params the request parameters provided for the item creation
     */
    Item createItem(Item item, def params) {

        Category parent
        Category child

        if (params['item-parent']) {
            parent = Category.get(Long.parseLong(params['item-parent']))
        }

        if (params['childCategory']) {
            child = Category.get(Long.parseLong(params['childCategory']))
        }

        item.category = parent
        item.subcategory = child

        if (!item.save()) {
            item.errors.each {
                log.error it
            }
            throw new ServiceException()
        }

        return item
    }

    Boolean deleteItem(Item item) {

        // delete item photos
        photoService.deleteItemPhotoRecords(item)

        // delete item
        item.delete()

        return Boolean.TRUE
    }

    def findItems(def params, Boolean count) {
        def items = Item.createCriteria().list {
            if (!count) {
                if (params.max) {
                    maxResults params.getInt('max')
                } else {
                    maxResults 10
                }

                if (params.offset) {
                    firstResult params.getInt('offset')
                } else {
                    firstResult 0
                }
            }

            if (params.parent && !"null".equalsIgnoreCase(params.parent.toString())) {
                Category category = Category.get(params['parent'])
                eq ('category', category)
            }

            if (params.child && !"null".equalsIgnoreCase(params.child.toString())) {
                Category subcategory = Category.get(params['child'])
                eq ('subcategory', subcategory)
            }

            if (count) {
                projections {
                    countDistinct('id')
                }
            }
        }
    }
}
