package locksmith

import org.locksmith.media.Photo

class MediaController {

    // dependency injection of the photo service
    def photoService

    // upload file handler
    def uploadFile() {
        // get file item
        def file = request.getFile('inputfile')

        if (file.empty) {
            // file cannot be empty !!!
            log.error ('File is empty.')
        }

        // make transfer to server physical file
        File physicalFile = new File('web-app/images/uploaded/' + file.getFileItem().fileName)
        file.transferTo(physicalFile)

        // create photo service record, if failed then delete the physical file as well
        if (!photoService.createItemPhotoRecord(null, file)) {
            physicalFile.delete()
        }

        response.sendError(200, 'Done')
    }
}
