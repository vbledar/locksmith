package org.locksmith.comms

/**
 * Created by vbledar on 6/13/14.
 */
class CommunicationsService {

    // injection of photo service
    def photoService

    Boolean deleteInformationMessage(InformationMessage informationMessage) {

        // delete photo of information message if one exists
        if (informationMessage.photo != null) {
            photoService.deletePhoto(informationMessage?.photo)
        }

        informationMessage.delete()
        return Boolean.TRUE
    }

    /**
     * Retrieve last 10 user messages.
     */
    def getLast10UserMessages() {
        def userMessages = UserMessage.createCriteria().list {
            maxResults 10

            order('dateCreated', 'desc')
        }
    }

    /**
     * Persist user message instance in database.
     *
     * @param userMessage the user message instance to persist.
     *
     * @return null if persist failed, otherwise, the persisted instance.
     */
    UserMessage createUserMessage(UserMessage userMessage) {

        if (!userMessage.save()) {
            userMessage.errors.each {
                log.error it
            }
            return null
        }

        return userMessage
    }

    /**
     * Delete user message instance.
     *
     * @param userMessage the user message to delete.
     *
     * @return true, if delete is successful.
     */
    Boolean deleteUserMessage(UserMessage userMessage) {
        userMessage.delete()
        return Boolean.TRUE
    }
}
