package locksmith

import org.locksmith.category.Category
import org.locksmith.comms.ContactForm
import org.locksmith.comms.InformationMessage
import org.locksmith.comms.UserMessage

class CategoriesController {

    // injection of item service
    def itemService

    // injection of mail service
    def mailService

    // injection of communications service
    def communicationsService

    // injection of grails application service
    def grailsApplication

    // render welcome page
    def index() {

        def commentMessages = communicationsService.getLast10UserMessages();
        def informationMessages = InformationMessage.findAll(" from InformationMessage info where info.visible = ?", [true])

        render (view: 'index', model: [informationMessages: informationMessages, commentMessages: commentMessages])
    }

    // render selected parent category
    def parentCategoryView() {
        // check category id in request params
        if (!params.parent) {
            log.error 'Category id not provided.'
            redirect(action: 'index')
        }

        log.error params

        // get selected parent category
        Category category = Category.get(params.getLong('parent'))

        // get selected subcategory if one has been provided
        Category subcategory
        if (params.child) {
            subcategory = Category.get(params.getLong('child'))
        } else {
            if (category != null && category.children != null && !category.children.isEmpty()) {
                subcategory = category.children.toArray()[0]
                params.child = subcategory?.id
            }
        }

        // get items in category and subcategory
        def items = itemService.findItems(params, false)

        render(view: 'category', model: [parentCategory: category,
                                         subcategory: subcategory,
                                         items: items])
    }

    def comms() {
        render (view: 'comms');
    }

    // send email using ajax
    def ajaxSendMessage() {

        log.error (params);

        // create contact form instance
        ContactForm contactForm = new ContactForm()
        bindData (contactForm, params)

        if (contactForm.validate()) {
            mailService.sendMail {
                to 'kleidaras.pefki@gmail.com'
                from contactForm.email
                subject contactForm.subject ? contactForm.subject : ''
                html g.render ( template: '/emails/contactUsEmail', model: [contactForm: contactForm])
            }

            render (contentType: 'application/json') {
                ['success': true, 'message': 'Email was sent successfully.']
            }

            return
        } else {

            contactForm.errors.each {
                log.error(it)
            }

            render (contentType: 'application/json') {
                ['success': false, 'message': 'Failed to send email. Please, try again later.']
            }
        }
    }

    // leave comment from user
    def ajaxLeaveComment() {
        log.error (params)

        // create comment instance
        UserMessage userMessage = new UserMessage()
        bindData(userMessage, params)

        // persist the instance
        if (communicationsService.createUserMessage(userMessage)) {
            render (contentType: 'application/json') {
                ['success': true, 'message': 'User message created successfully.']
            }
        } else {
            render (contentType: 'application/json') {
                ['success': false, 'message': 'Παρουσιάστηκε σφάλμα κατά την αποθήκευση του σχολίου σας. Παρακαλώ, δοκιμάστε αργότερα.']
            }
        }
    }

    def ajaxDeleteComment() {
        // retrieve user message instance to delete
        UserMessage userMessage = UserMessage.get(params.getLong('userMessageId'))

        if (userMessage) {
            if(!communicationsService.deleteUserMessage(userMessage)) {
                render (contentType: 'application/json') {
                    ['success': false, 'message': 'User message was not deleted.']
                }
            }
        } else {
            render (contentType: 'application/json') {
                ['success': false, 'message': 'User message with id [' + params.userMessageId + ' was not found.']
            }
        }
    }

    def termsAndConditions() {
        render (view: 'termsAndConditions')
    }
}
