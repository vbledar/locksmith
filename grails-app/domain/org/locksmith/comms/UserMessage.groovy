package org.locksmith.comms

/**
 * Created by vbledar on 6/17/14.
 */
class UserMessage {

    String message

    String username

    Date dateCreated
    Date lastUpdated

    static constraints = {
        message (nullable: false, minSize: 10, maxSize: 2000)
        username (nullable: true)
    }
}
