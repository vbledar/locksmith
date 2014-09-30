<!-- Modal -->
<div class="modal fade" id="create-category-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <g:form name="category-creation-form" controller="admin" action="ajaxCreateCategory">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        <g:message code="admin.create.category.dialog.title" default="Δημιουργία Κατηγορίας" />
                    </h4>
                </div>
                <div class="modal-body text-left">

                    <div class="form-group">
                        <label for="name">
                            <g:message code="field.name.label" default="Όνομα" />
                        </label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή ονόματος')}">
                    </div>

                    <div class="form-group">
                        <label for="description">
                            <g:message code="field.description.label" default="Περιγραφή" />
                        </label>
                        <g:textArea name="description"
                                    class="form-control"
                                    rows="5"
                                    cols="20"
                                    placeholder="${message(code: 'field.description.place.holder.value', default: 'Εισαγωγή περιγραφής')}"
                                    style="resize: none" />
                    </div>

                    <div class="form-group">
                        <label for="ordering">
                            <g:message code="field.ordering.label" default="Διάταξη" />
                        </label>
                        <input id="ordering" name="ordering" type="number" class="form-control" placeholder="${message(code: 'field.ordering.place.holder.value', default: 'Εισαγωγή Διάταξης')}">
                    </div>

                    <g:if test="${!(controllerName?.equalsIgnoreCase('admin') && actionName?.equalsIgnoreCase('parentCategories'))}">
                        <div class="form-group">
                            <label for="parent">
                                <g:message code="field.parent.label" default="Κατηγορία" />
                            </label>
                            <g:select name="parent"
                                      class="form-control"
                                      from="${parentCategories}"
                                      optionKey="id"
                                      value="${parentCategories?.isEmpty() ? null : parentCategories[0]?.id}"/>
                        </div>
                    </g:if>

                    <div class="alert alert-danger hidden">
                        <label id="add-category-error-message"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="close.button.label" default="Ακύρωση" />
                    </button>
                    <button id="addCategoryButton" related-dialog="create-category-dialog" related-form="category-creation-form" type="button" class="btn btn-primary">
                        <g:message code="add.button.label" default="Προσθήκη"/>
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script type="application/javascript">

    $(function() {
        // add category button click handler
        $('#addCategoryButton').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault;

            // execute ajax request
            execARFromElementWithSuccessAndErrorCallbacks(event, $(this), addCategorySuccess, addCategoryFailed)
        });
    });

    function addCategorySuccess(event, element, data, textStatus, jqXHR) {
        // get related dialog id
        var relatedDialog = $(element).attr('related-dialog');

        // retrieve related form id
        var formId = $(element).attr('related-form');

        if (data.success == true) {
            $('#' + formId).trigger('reset');
            $('#' + relatedDialog).modal('hide');
            $('#add-category-error-message').parent().addClass('hidden');
        } else {
            $('#add-category-error-message').text(data.message);
            $('#add-category-error-message').parent().removeClass('hidden');
        }
    }

    function addCategoryFailed(event, element, message) {
        console.log ("Failed to execute ajax request.");
        $('#add-category-error-message').text(message);
        $('#add-category-error-message').parent().removeClass('hidden');
    }
</script>
