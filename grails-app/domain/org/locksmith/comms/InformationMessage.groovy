package org.locksmith.comms

import org.locksmith.media.Photo

/**
 * Created by vbledar on 6/13/14.
 */
class InformationMessage {

    String title // information title to show

    String message // information message to show

    Photo photo // photo with information message

    Boolean visible = Boolean.TRUE // defines if this instance should be visible

    Date dateCreated // date of creation
    Date lastUpdated // last date updated

    static constraints = {
        title (nullable: true)
        message (nullable: false, maxSize: 1000)
        photo (nullable: true)
        visible (nullable: false)
    }
}
