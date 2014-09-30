<!-- Modal -->
<div class="modal fade" id="contact-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form name="contact-creation-form" controller="categories" action="ajaxSendMessage">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        <g:message code="contact.us.category.dialog.title" default="Επικοινωνήστε Μαζί Μας" />
                    </h4>
                </div>
                <div class="modal-body text-left">

                    <div class="form-group">
                        <label for="fullname">
                            <g:message code="field.user.full.name.label" default="Όνοματεπώνυμο" />
                        </label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή Πλήρους Ονόματος')}">
                    </div>

                    <div class="form-group">
                        <label for="email">
                            <g:message code="field.email.label" default="Email" />
                        </label>
                        <input type="text" class="form-control" id="email" name="email" placeholder="${message(code: 'field.email.place.holder.value', default: 'Εισαγωγή Email')}">
                    </div>

                    <div class="form-group">
                        <label for="subject">
                            <g:message code="field.subject.label" default="Θέμα" />
                        </label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="${message(code: 'field.subject.place.holder.value', default: 'Εισαγωγή Θέματος')}">
                    </div>

                    <div class="form-group">
                        <label for="description">
                            <g:message code="field.message.label" default="Μήνυμα" />
                        </label>
                        <g:textArea name="message"
                                    class="form-control"
                                    rows="5"
                                    cols="20"
                                    placeholder="${message(code: 'field.message.place.holder.value', default: 'Εισαγωγή Μηνύματος')}"
                                    style="resize: none" />
                    </div>

                    <div class="alert alert-warning" style="font-size: 10px;">
                        <label style="font-size: 12px;">Όροι Χρήσης</label>
                        <div class="full-line-black"></div>
                        <p>Η εισαγωγή όλων των παραπάνω πεδίων είναι απαραίτητη.</p>
                        <p>To email σας θα εμφανίζεται ως αποστολέας στο μήνυμα που θα λάβουμε και θα χρησιμοποιηθεί
                        στην περαιτέρω επικοινωνία που θα έχουμε μαζί σας.</p>
                        <p>Τα προσωπικά στοιχεία σας δεν θα μοιραστούν.</p>
                        <p>Η αποστολή αυτού του μηνύματος αυτομάτως συνεπάγεται ότι αποδέχεστε τους όρους αυτούς.</p>
                    </div>
                    <div class="alert alert-danger hidden">
                        <label id="add-category-error-message"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="close.button.label" default="Ακύρωση" />
                    </button>
                    <button id="sendContactMessage" related-dialog="contact-dialog" related-form="contact-creation-form" type="button" class="btn btn-primary">
                        <span class="glyphicon glyphicon-arrow-right"></span>
                        <g:message code="add.button.label" default="Αποστολή"/>
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script type="application/javascript">

    $(function() {

        $('#sendContactMessage').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // execute ajax request
            execARFromElementWithSuccessAndErrorCallbacks(event, $(this), messageSentSuccess, messageSentFailure)
        });
    });

    function messageSentSuccess(event, element, data, textStatus, jqXHR) {
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

    function messageSentFailure(event, element, message) {
        console.log ("Failed to execute ajax request.");
        $('#add-category-error-message').text(message);
        $('#add-category-error-message').parent().removeClass('hidden');
    }
</script>
