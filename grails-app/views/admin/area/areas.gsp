<%--
  Created by IntelliJ IDEA.
  User: nvasili
  Date: 29/5/2014
  Time: 2:55 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin"/>
    <title>
        <g:message code="admin.areas.label" default="Περιοχές"/>
    </title>
</head>

<body>

    <g:form controller="admin" action="createArea">
        <div class="row text-left">
            <div class="col-sm-8">
                <div class="form-group">
                    <label class="white-font-color">
                        <g:message code="field.area.name.label" default="Όνομασία Περιοχής" />
                    </label>
                    <input id="area-name-input" type="text" class="form-control" name="name" value="${area?.name}" placeholder="${message (code: 'field.namel.placeholder', default: 'Εισάγετε όνομα')}"/>
                </div>
            </div>
            <div class="col-sm-2" style="margin-top: 25px;">
                <button class="btn btn-primary" type="submit">
                    <g:message code="button.save.label" default="Αποθήκευση" />
                </button>
            </div>
        </div>
    </g:form>

    <div class="full-line"></div>

    <div class="row self-up-separator10">
        <g:form controller="admin" action="deleteArea" name="delete-area-form">
            <div class="col-sm-12">
                <div class="list-group">
                    <g:each in="${areas}" status="i" var="area">
                        %{--<li class="list-group-item">${area?.name}</li>--}%
                        <div class="row info-panel white-font-color">
                            <div class="col-sm-10">
                                <h4>
                                    ${area?.name}
                                </h4>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-danger delete-area-button" related-form="delete-area-form" item-id="${area?.id}">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </div>
                        </div>
                        <div class="spacer10"></div>
                    </g:each>
                </div>
            </div>

            <g:hiddenField id="area-id" name="areaId" value=""/>
        </g:form>
    </div>
</body>

<g:javascript>

    $(function() {

        $('#area-name-input').focus();

        $('.delete-area-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve area id to delete
            var areaId = $(this).attr('item-id');

            // apply area id in hidden input field
            $('#area-id').val(areaId);

            // retrieve form id to submit
            var formId = $(this).attr('related-form');
            $('#'+formId).submit();
        })
    })
</g:javascript>
</html>

