<div id="category-panel-${category?.id}" class="text-left info-panel self-up-separator20">
    <g:form name="category-update-form-${category?.id}" controller="admin" action="ajaxUpdateCategory">
        <div class="row">
            <div class="col-sm-7">
                <h4 class="white-font-color">${(index + 1) + ') - ' + category?.name}</h4>
            </div>

            <div class="col-sm-3 text-right">
                <button class="btn btn-sm btn-primary update-category-button" related-form="category-update-form-${category?.id}">
                    <span class="glyphicon glyphicon-ok"></span>
                    <g:message code="update.button.label" default="Ενημέρωση"/>
                </button>
            </div>

            <div class="col-sm-2">
                <button class="btn btn-sm btn-danger delete-category-button" category-id="${category?.id}">
                    <span class="glyphicon glyphicon-trash"></span>
                    <g:message code="delete.button.label" default="Διαγραφή"/>
                </button>
            </div>
        </div>

        <div class="full-line"></div>

        <div class="row">
            <div class="col-sm-10">

                <g:hiddenField name="id" value="${category?.id}" />

                <div class="form-group">
                    <label for="name">
                        <g:message code="field.name.label" default="Όνομα"/>
                    </label>
                    <input type="text" class="form-control" id="name" name="name" value="${category?.name}"
                           placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή ονόματος')}">
                </div>

                <div class="form-group">
                    <label for="description">
                        <g:message code="field.description.label" default="Περιγραφή"/>
                    </label>
                    <g:textArea name="description"
                                class="form-control"
                                rows="5"
                                cols="20"
                                value="${category?.description}"
                                placeholder="${message(code: 'field.description.place.holder.value', default: 'Εισαγωγή περιγραφής')}"
                                style="resize: none"/>
                </div>

                <div class="form-group">
                    <label for="ordering">
                        <g:message code="field.ordering.label" default="Διάταξη"/>
                    </label>
                    <input id="ordering"
                           name="ordering"
                           type="number"
                           class="form-control"
                           value="${category?.ordering}"
                           placeholder="${message(code: 'field.ordering.place.holder.value', default: 'Εισαγωγή Διάταξης')}">
                </div>

                <div class="form-group">
                    <label for="parent">
                        <g:message code="field.parent.label" default="Κατηγορία"/>
                    </label>
                    <g:select name="parent"
                              class="form-control"
                              from="${parentCategories}"
                              value="${category?.parent?.id}"
                              optionKey="id"
                              noSelection="${['null': message(code: 'admin.parent.category.selection', default: 'Κεντρική κατηγορία')]}"/>
                </div>
            </div>
        </div>
    </g:form>
</div>

<g:javascript>

    $(function() {

        // delete category button event handler
        $('.delete-category-button').off('click').on('click', function(event) {
            event.preventDefault();

            // show loading spinner
            showSpinner();

            // the element generating the event
            var element = $(this);

            // category id and category panel element
            var categoryId = $(this).attr('category-id');
            var categoryPanel = $('#category-panel-'+categoryId);

            // request parameters
            var parameters = {};
            parameters.categoryId = categoryId;

            // create request url
            var actionUrl = '${createLink(controller: 'admin', action: 'ajaxDeleteCategory')}';

            // execute ajax request
            execARWithSuccessAndErrorCallbacks(event, element, actionUrl, parameters, deleteSuccess, deleteFailed);
        });

        $('.update-category-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // the element generating the event
            var element = $(this);

            // execute ajax request
            execARFromElementWithSuccessAndErrorCallbacks(event, element, updateSuccess, updateFailed);
        });
    });

    // callback function for update success handling
    function updateSuccess(event, element, data, textStatus, jqXHR) {
        console.log ('Post succeeded...');

        try {
            if (data.success == true) {
                console.log ('Update was successful.');
                return;
            }
            console.log ('Update failed.');
        } finally {
            // hide the spinner
            hideSpinner();
        }
    }

    // callback function for update failure handling
    function updateFailed(event, element, message) {
        console.log(message);

        // hide the spinner
        hideSpinner();
    }

    // callback function for delete success handling
    function deleteSuccess(event, element, data, textStatus, jqXHR) {
        console.log('Post succeeded...');
        try {
            // category id and category panel element
            var categoryId = $(element).attr('category-id');
            var categoryPanel = $('#category-panel-'+categoryId);

            if (data.success == true) {
                $(categoryPanel).slideToggle('slow', function() {
                    $(categoryPanel).remove();
                });
            }
        } finally {
            // hide the spinner
            hideSpinner();
        }
    }

    // callback function for delete failure handling
    function deleteFailed(event, element, data) {
        console.debug('Post failed...');

        // hide the spinner
        hideSpinner();
    }
</g:javascript>