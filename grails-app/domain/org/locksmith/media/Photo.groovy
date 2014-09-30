package org.locksmith.media

class Photo {

    String filename
    Long size

    static constraints = {
        filename (blank: false)
        size (nullable: false, max: (1024 * 1024 * 10L))
    }
}
