<!-- Modal -->
<div class="modal fade" id="comment-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form name="comment-creation-form" controller="categories" action="ajaxLeaveComment">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        <g:message code="contact.us.category.dialog.title" default="Αφήστε Σχόλιο" />
                    </h4>
                </div>
                <div class="modal-body text-left">

                    <div class="form-group">
                        <label for="fullname">
                            <g:message code="field.username.name.label" default="Ψευδώνυμο" />
                        </label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή Ψευδώνυμου')}">
                    </div>

                    <div class="form-group">
                        <label for="message">
                            <g:message code="field.message.label" default="Μήνυμα" />
                        </label>
                        <g:textArea name="message"
                                    class="form-control"
                                    rows="5"
                                    cols="20"
                                    placeholder="${message(code: 'field.message.place.holder.value', default: 'Εισαγωγή Μηνύματος')}"
                                    style="resize: none" />
                    </div>

                    <div class="alert alert-danger hidden">
                        <label id="add-category-error-message"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="close.button.label" default="Ακύρωση" />
                    </button>
                    <button id="sendCommentMessage" related-dialog="comment-dialog" related-form="comment-creation-form" type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span>
                        <g:message code="create.button.label" default="Δημιουργία"/>
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script type="application/javascript">

    $(function() {

        $('#sendCommentMessage').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // execute ajax request
            execARFromElementWithSuccessAndErrorCallbacks(event, $(this), commentSentSuccess, commentSentFailure)
        });
    });

    function commentSentSuccess(event, element, data, textStatus, jqXHR) {
        // get related dialog id
        var relatedDialog = $(element).attr('related-dialog');

        // retrieve related form id
        var formId = $(element).attr('related-form');

        if (data.success == true) {
            $('#' + formId).trigger('reset');
            $('#' + relatedDialog).modal('hide');
            $('#add-category-error-message').parent().addClass('hidden');
            alert('Το μήνυμά σας έχει αποσταλεί επιτυχώς.');
        } else {
            $('#add-category-error-message').text(data.message);
            $('#add-category-error-message').parent().removeClass('hidden');
        }
    }

    function commentSentFailure(event, element, message) {
        console.log ("Failed to execute ajax request.");
        $('#add-category-error-message').text(message);
        $('#add-category-error-message').parent().removeClass('hidden');
    }
</script>
