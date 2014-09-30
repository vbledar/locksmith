<%--
  Created by IntelliJ IDEA.
  User: nvasili
  Date: 3/6/2014
  Time: 3:18 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.locksmith.category.Category" %>

<html>
<head>
    <meta name="layout" content="admin"/>
    <title>
        <g:message code="admin.category.items.label" default="Αντικείμενα"/>
    </title>
</head>

<body>

<div class="row white-font-color">
    <div class="col-sm-12">
        <h3 class="pull-left"><g:message code="admin.category.items.title" default="Διαχείριση Αντικειμένων"/></h3>
    </div>
</div>

<div class="full-line"></div>

<div class="row white-font-color self-up-separator20">
    <div class="col-sm-12">
        <g:form class="form-horizontal" role="form" controller="admin" action="categoryItems" name="filter-category-items">
            <div class="col-sm-7">
                <div class="form-group">
                    <label for="parent" class="col-sm-4 control-label">
                        <g:message code="field.parent.label" default="Κατηγορία" />
                    </label>
                    <div class="col-sm-8">
                        <g:select id="parentCategory"
                                  name="parent"
                                  class="form-control"
                                  from="${parentCategories}"
                                  optionKey="id"
                                  value="${params.parent}"
                                  noSelection="${['null': message(code: 'admin.parent.category.selection', default: 'Όλες')]}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="parent" class="col-sm-4 control-label">
                        <g:message code="field.child.label" default="Υπό-Κατηγορία" />
                    </label>
                    <div class="col-sm-8 child-categories-container">
                        <g:select id="childCategory"
                                  name="child"
                                  class="form-control"
                                  from="${childCategories}"
                                  optionKey="id"
                                  value="${params.child}"
                                  noSelection="${['null': message(code: 'admin.parent.category.selection', default: 'Όλες')]}"
                                  related-form="filter-category-items"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="btn-group-vertical pull-right">
                    <button id="show-create-item-dialog" class="btn btn-sm btn-primary pull-right" data-toggle="tooltip" data-placement="top" title='<g:message code="button.add.item.tooltip" default="Επιλέξτε για να προσθέσετε ένα αντικείμενο." />'>
                        <span class="glyphicon glyphicon-plus"></span>
                        <g:message code="admin.item.add.label" default="Προσθήκη Αντικειμένου" />
                    </button>
                </div>
            </div>
        </g:form>
    </div>
</div>

<div class="full-line"></div>

<div class="spacer20"></div>

<div class="row">
    <div class="col-sm-12">
        <g:render template="category/itemList" model="[items: items, itemsTotal: itemsTotal]" />
    </div>
</div>

<g:render template="category/dialog/createItemDialog" model="[parentCategories: parentCategories]"/>

</body>

<g:javascript>

    $(function() {
        $('#parentCategory').off('change').on('change', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // generate parameter values
            var parameters = {};
            parameters.parent = $(this).val();

            // generate actionUrl for ajax request
            var actionUrl = '<g:createLink controller="admin" action="ajaxRenderChildCategories"/>';

            // request ajax execution
            execARWithSuccessAndErrorCallbacks(event, $(this), actionUrl, parameters, parentChangeSuccess, parentChangeFailure);
        });

        $('#childCategory').off('change').on('change', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve related form and submit it
            var formId = $(this).attr('related-form');
            $('#'+formId).submit();
        });

        $('#show-create-item-dialog').off('click').on('click', function(event) {
            event.preventDefault();
            $('#create-item-dialog').modal('show');
        });
    });

    // parent change success handling
    function parentChangeSuccess(event, element, data, textStatus, jqXHR) {
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
    function parentChangeFailure(event, element, message) {
        console.log (message)
    }
</g:javascript>
</html>