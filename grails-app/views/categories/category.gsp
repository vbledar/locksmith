<%--
  Created by IntelliJ IDEA.
  User: nvasili
  Date: 3/6/2014
  Time: 2:26 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${category?.name}</title>
    <meta name="layout" content="internalMenu"/>
</head>

<body>

<content tag="internalMenu">
    <div class="internal-navigation-menu">
        <ul class="nav nav-pills nav-stacked">
            <g:if test="${!parentCategory?.children.isEmpty()}">
                <g:each in="${parentCategory?.children}" status="i" var="child">
                    <li class="${controllerName?.equalsIgnoreCase("categories") &&
                                 actionName?.equalsIgnoreCase("parentCategoryView") &&
                                 subcategory?.id == child?.id ? 'active' : ''}">
                        <g:link controller="categories" action="parentCategoryView" params="['parent': parentCategory?.id, 'child': child?.id]" data-toggle="tooltip" data-placement="top" title='${child?.description}'>
                            ${child?.name}
                        </g:link>
                    </li>
                </g:each>
            </g:if>
        </ul>
    </div>
</content>

<div class="spacer20"></div>

<div class="row">
    <div class="col-sm-12">
        <g:render template="itemsList" model="[items: items]" />
    </div>
</div>


</body>
</html>