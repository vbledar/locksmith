package org.locksmith.item

import org.locksmith.media.Photo

class ItemPhoto extends Photo {

    Boolean mainPhoto = Boolean.FALSE // defines if this is the main photo for the item

    Integer ordering // photo ordering index

    // belongs to an item
    static belongsTo = [item: Item]

    static constraints = {
        mainPhoto (nullable: true)
        ordering (nullable: true)
        item (nullable: true)
    }

}
