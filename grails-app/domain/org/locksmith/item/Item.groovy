package org.locksmith.item

import org.locksmith.category.Category
import org.locksmith.media.Photo

class Item {

    String name // product or service name
    String description // product or service description

    BigDecimal price // product or service price

    Boolean visible = Boolean.TRUE // defines if this item is visible

    // belongs to a parent category and a subcategory
    static belongsTo = [category: Category, subcategory: Category]

    // has many photos
    static hasMany = [photos: ItemPhoto]

    static constraints = {
        name (nullable: false, maxSize: 100)
        description (nullable: true, maxSize: 2000)
        price (nullable: true)
        visible (nullable: false)
        category (nullable: false)
        subcategory (nullable: false)
        photos (nullable: true)
    }

    Photo getFirstPhoto() {
        Photo photo
        this.photos.each {
            if (!photo)
                photo = it
        }
        return photo
    }

    String getFirstPhotoFilename() {
        String filename = null
        this.photos.each {
            if (filename == null)
                filename = it.filename
        }
        return filename
    }
}
