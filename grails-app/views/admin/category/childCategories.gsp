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
        <g:message code="admin.child.categories.label" default="Υπό-Κατηγορίες"/>
    </title>
</head>

<body>

<div class="row white-font-color">
    <div class="col-sm-12">
        <h3 class="pull-left"><g:message code="admin.child.categories.title" default="Διαχείριση Υπό-Κατηγοριών"/></h3>
        <button id="showCreateCategoryDialog" class="btn btn-sm btn-primary pull-right self-up-separator20 self-down-separator10">
            <span class="glyphicon glyphicon-plus"></span>
            <g:message code="admin.child.category.add.label" default="Προσθήκη Υπό-Κατηγορίας" />
        </button>
    </div>
</div>

<div class="full-line"></div>

<div class="row white-font-color self-up-separator20">
    <div class="col-sm-12">
        <g:form class="form-horizontal" role="form" name="filter-child-categories" controller="admin" action="childCategories">
            <div class="form-group">
                <label for="parent" class="col-sm-1 control-label">
                    <g:message code="field.parent.label" default="Κατηγορία" />
                </label>
                <div class="col-sm-3">
                    <g:select id="parent-category-selector"
                              name="parent"
                              class="form-control"
                              from="${parentCategories}"
                              value="${params.parent}"
                              optionKey="id"
                              noSelection="${['null': message(code: 'admin.parent.category.selection', default: 'Όλες')]}"
                              related-form="filter-child-categories" />
                </div>
            </div>
        </g:form>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="full-line"></div>
    </div>
</div>

<div class="row white-font-color">
    <div class="col-sm-12 child-categories-container">
        <g:if test="${childCategories?.isEmpty()}">
            <h5><g:message code="admin.child.categories.list.empty" default="Δεν έχετε δημιουργήσει υπό-κατηγορίες." /></h5>
        </g:if>
        <g:else>
            <g:render template="category/categoryList" model="[categories: childCategories]" />
        </g:else>
    </div>
</div>

<g:render template="category/dialog/createCategoryDialog" model="[parentCategories: parentCategories]"/>

</body>

<g:javascript>
    $(function() {
        $('#showCreateCategoryDialog').off('click').on('click', function(event) {
            $('#create-category-dialog').modal('show');
        });

        $('#parent-category-selector').off('change').on('change', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // retrieve related form and submit it
            var formId = $(this).attr('related-form');
            $('#'+formId).submit();
        });
    });
</g:javascript>
</html>

