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
        <g:message code="admin.parent.categories.label" default="Κατηγορίες"/>
    </title>
</head>

<body>

<div class="row white-font-color">
    <div class="col-sm-12">
        <h3 class="pull-left"><g:message code="admin.parent.categories.title" default="Διαχείριση Κατηγοριών"/></h3>
        <button id="showCreateCategoryDialog" class="btn btn-sm btn-primary pull-right self-up-separator20 self-down-separator10">
            <span class="glyphicon glyphicon-plus"></span>
            <g:message code="admin.category.add.label" default="Προσθήκη Κατηγορίας" />
        </button>
    </div>
</div>

<div class="full-line"></div>

<div class="row white-font-color">
    <div class="col-sm-12">
        <g:if test="${parentCategories?.isEmpty()}">
            <h5><g:message code="admin.parent.categories.list.empty" default="Δεν έχετε δημιουργήσει κατηγορίες." /></h5>
        </g:if>
        <g:else>
            <g:render template="category/categoryList" model="[categories: parentCategories]" />
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
    });
</g:javascript>
</html>

