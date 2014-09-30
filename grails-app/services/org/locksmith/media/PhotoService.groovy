package org.locksmith.media

import org.locksmith.item.Item
import org.locksmith.item.ItemPhoto

class PhotoService {

    // injection of grails service
    def grailsApplication

    /**
     * Transfer physical photo item from client to server.
     *
     * @param itemFile the DiskFileItem instance which is used to physically transfer the file.
     *
     * @return true, if the transfer is completed successfully, false, otherwise.
     */
    Boolean transferPhysicalFileLocally(def itemFile) {
        // read configuration for uploaded images directory
        String directory = grailsApplication.config.locksmith.uploaded.images.dir

        // make transfer to server physical file
        File physicalFile = new File(directory + itemFile.fileItem.fileName)
        itemFile.transferTo(physicalFile)
        return Boolean.TRUE
    }

    /**
     * Delete physical file locally.
     *
     * @param photo the photo instance related with the file to be deleted.
     *
     * @return true, if the file is deleted, false, otherwise.
     */
    Boolean deletePhysicanFileLocally(Photo photo) {
        // read configuration for uploaded images directory
        String directory = grailsApplication.config.locksmith.uploaded.images.dir

        // get an instance on the physical file and delete it
        File physicalFile = new File('web-app/images/uploaded/' + photo?.filename)
        if (physicalFile.exists()) {
            physicalFile.delete()
        }
        return Boolean.TRUE
    }

    /**
     * Create file entry in database.
     *
     * @param fileItem the file item wrapping the actual file being uploaded.
     *
     * @return true if the record is created successfully, false, otherwise.
     */
    Photo createPhotoRecord(def fileItem) {
        Photo photo = new Photo(filename: fileItem.getFileItem().fileName, size: fileItem.size)
        if (!photo.save()) {
            photo.errors.each {
                log.error it
            }
        }
        return photo
    }

    /**
     * Create item photo entry in database.
     *
     * @param fileItem the file item wrapping the actual file being uploaded.
     *
     * @return true if the record is created successfully, false, otherwise.
     */
    Boolean createItemPhotoRecord(Item item, def fileItem) {
        Photo photo = new ItemPhoto(filename: fileItem.getFileItem().fileName, size: fileItem.size, item: item)
        if (!photo.save()) {
            photo.errors.each {
                log.error it
            }
            return false
        }

        if (!item.photos) {
            item.photos = new HashSet<>()
        }

        item.photos.add(photo)
        if (!item.save()) {
            item.errors.each {
                log.error it
            }
            return false
        }
        return true
    }

    /**
     * Delete all photos of an item with the physical files as well.
     *
     * @param item the instance which photos will be deleted.
     *
     * @return true, if the operation completes successfully.
     */
    Boolean deleteItemPhotoRecords(Item item) {
        item?.photos.each {
            it.delete()

            if (!deletePhysicanFileLocally(it)) {
                log.error 'Failed to delete file with name: ' + it.filename
            }
        }
        return Boolean.TRUE
    }

    /**
     * Delete a photo instance.
     *
     * @param photo the photo instance to delete.
     *
     * @return true, if delete is successful, false, otherwise.
     */
    Boolean deletePhoto(Photo photo) {
        if (photo) {

            deletePhysicanFileLocally(photo) // remove physical file
            photo.delete() // remove record in database
        }
        return Boolean.TRUE
    }
}
