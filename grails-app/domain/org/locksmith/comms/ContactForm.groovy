package org.locksmith.comms

/**
 * Created by vbledar on 6/13/14.
 */
class ContactForm {

    String fullname

    String email

    String subject

    String message

    static constraints = {
        fullname (nullable: false)
        email (nullable: false, email: true)
        subject (nullable: true)
        message (nullable: false, minSize: 10, maxSize: 3000)
    }
}
