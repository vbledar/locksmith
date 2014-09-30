<!-- Modal -->
<div class="modal fade" id="create-item-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        <g:message code="admin.create.item.dialog.title" default="Δημιουργία Αντικειμένου" />
                    </h4>
                </div>
                <div class="modal-body text-left">

                    <div class="row">
                        <g:each in="${1..4}" status="i" var="index">
                            <div class="col-sm-3">
                                <div id="image-show-${index}" class="image-show image-upload-holder text-center">
                                    <img id="photo-holder-${index}" class="hidden img-thumbnail" src="#" />
                                </div>

                                <input id="file-input-${index}" type="file" class="hidden file-input-holder" photo-index="${index}"/>

                                <div class="spacer10"></div>

                                <button class="btn btn-primary btn-sm upload-photo" style="width: 100%" related-form="upload-photo-form" photo-index="${index}">
                                    <span class="glyphicon glyphicon-upload"></span>
                                </button>
                            </div>
                        </g:each>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="full-line-black"></div>
                        </div>
                    </div>

                    <g:form name="item-creation-form" controller="admin" action="ajaxCreateItem">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="name">
                                        <g:message code="field.name.label" default="Όνομα" />
                                    </label>
                                    <input type="text" class="form-control col-sm-5" id="name" name="name" placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή ονόματος')}">
                                </div>
                            </div>

                            <div class="col-sm-12">
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
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="price">
                                        <g:message code="field.price.label" default="Τιμή" />
                                    </label>
                                    <input id="price"
                                           name="price"
                                           type="number"
                                           class="form-control"
                                           placeholder="${message(code: 'field.price.place.holder.value', default: 'Εισαγωγή τιμής')}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group" style="padding-top: 20px;">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <div class="checkbox">
                                            <label>
                                                <input name="visible" type="checkbox" checked="true"> <g:message code="field.visible.label" default="Κατηγορία ορατή?" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="item-parent">
                                        <g:message code="field.category.label" default="Κατηγορία" />
                                    </label>
                                    <g:select id="item-parent-category"
                                              name="item-parent"
                                              class="form-control"
                                              from="${parentCategories}"
                                              optionKey="id"
                                              value="${parentCategories?.isEmpty() ? null : parentCategories[0]?.id}"/>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="childCategory">
                                        <g:message code="field.sub.category.label" default="Υπό-Κατηγορία" />
                                    </label>
                                    <div class="child-categories-container">
                                        <g:select name="childCategory"
                                                  class="form-control"
                                                  from="${childCategories}"
                                                  optionKey="id"
                                                  value="${params.subcategory ? params.subcategory : childCategories[0]?.id}"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </g:form>

                    <div class="alert alert-danger hidden">
                        <label id="add-category-error-message"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="close.button.label" default="Ακύρωση" />
                    </button>
                    <button id="add-item-button" related-dialog="create-item-dialog" related-form="item-creation-form" type="button" class="btn btn-primary">
                        <g:message code="add.button.label" default="Προσθήκη"/>
                    </button>
                </div>
        </div>
    </div>
</div>

<script type="application/javascript">

    $(function() {
        // add category button click handler
//        $('#add-item-button').off('click').on('click', function(event) {
//            // prevent default behaviour
//            event.preventDefault;
//
//            // execute ajax request
//            execARFromElementWithSuccessAndErrorCallbacks(event, $(this), addCategorySuccess, addCategoryFailed)
//        });

        // click handler on upload photo button
        $('.upload-photo').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve photo index
            var index = $(this).attr('photo-index');

            // simulate click on input element
            $('#file-input-'+index).trigger('click');
        });

        // image selected renderer
        $('.file-input-holder').on('change', function(event) {
            // retrieve photo index
            var index = $(this).attr('photo-index');

            // render image before upload
            if (this.files && this.files[0]) {
                console.log('Trying to load the image with index: ' + index);
                var reader = new FileReader();
                reader.onload = function(e) {
                    console.log('Image loaded with index: ' + index);
                    $('#photo-holder-'+index).attr('src', e.target.result);
                    $('#photo-holder-'+index).removeClass('hidden');
                    $('#image-show-'+index).removeClass('image-show');
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        // add upload photo button click handler
        $('#add-item-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve related dialog
            var relatedDialog = $(this).attr('related-dialog');

            // retrieve form id
            var formId = $(this).attr('related-form');

            // retrieve form action
            var actionUrl = $('#'+formId).attr('action');
            console.log('Action url' + actionUrl);

            var data = new FormData();

            // inject all file input holders in the form data array
            $.each($('.file-input-holder'), function(itIndex, element) {
                var inputElement = $(element)[0];
                var file = inputElement.files[0];
                if (file === undefined) {
                    console.log('No file has been defined.');
                } else {
                    console.log('Appending file in form data.');
                    data.append ('itemphoto'+itIndex, file);
                }
            });

            var formData = $('#'+formId).serializeArray();
            $.each(formData, function(itIndex, formInput) {
                data.append(formInput.name, formInput.value);
            });

            // attempt form ajax submit
            $.ajax(actionUrl, {
                complete: function() { // completion event handler
                    console.log('done');
                },
                contentType: false, // set to false so that server captures multipart http request type
                data: data, // the files attached
                processData: false, // set to false so that server captures multipart http request type
                success: function(data, textStatus, jqXHR) { // success event handler
                    console.log('Successfully posted request.')
                    console.log(data);
                    if (data.success === false) {
                        $('#add-category-error-message').text(data.message);
                        $('#add-category-error-message').parent().removeClass('hidden');
                    } else {
                        $('.category-items-table').append(data);
                        $('#'+relatedDialog).modal('hide');
                    }
                },
                type: 'POST' // POST method type
            });
        });

        $('#item-parent-category').off('change').on('change', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // generate parameter values
            var parameters = {};
            parameters.parent = $(this).val();

            // generate actionUrl for ajax request
            var actionUrl = '<g:createLink controller="admin" action="ajaxRenderChildCategories"/>';

            // request ajax execution
            execARWithSuccessAndErrorCallbacks(event, $(this), actionUrl, parameters, itemParentChangeSuccess, itemParentChangeFailure);
        });
    });

    // parent change success handling
    function itemParentChangeSuccess(event, element, data, textStatus, jqXHR) {
        try {
            $('.child-categories-container').html(data);
        } catch(e) {
            console.log (e.message);
        } finally {
            // hide the spinner
            hideSpinner();
        }
    }

    // parent change failure handling
    function itemParentChangeFailure(event, element, message) {
        console.log (message)
    }

    // add category success handler
    function addItemSuccess(event, element, data, textStatus, jqXHR) {
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

    // add category failure handler
    function addItemFailed(event, element, message) {
        console.log ("Failed to execute ajax request.");
        $('#add-category-error-message').text(message);
        $('#add-category-error-message').parent().removeClass('hidden');
    }
</script>
