<%@ page import="org.locksmith.category.Category" %>

%{--<div class="container">--}%
    <div class="row">
        <div class="col-sm-12">
            <ul class="nav nav-tabs nav-justified">
                <li class="${controllerName?.equalsIgnoreCase("categories") && actionName?.equalsIgnoreCase("index") ? 'active' : ''}">
                    <g:link controller="categories" action="index">
                        Καλώς Ήρθατε
                    </g:link>
                </li>

                <g:each in="${Category?.getParentCategories()}" status="i" var="parent">
                    <li class="${controllerName?.equalsIgnoreCase('categories') &&
                                 actionName?.equalsIgnoreCase('parentCategoryView') &&
                                 parentCategory?.id == parent?.id ? 'active' : ''
                    }">
                        <g:link controller="categories" action="parentCategoryView" params="['parent': parent?.id]" data-toggle="tooltip" data-placement="top" title='${parent?.description}'>
                            ${parent?.name}
                        </g:link>
                    </li>
                </g:each>

                <li class="${controllerName?.equalsIgnoreCase("categories") && actionName?.equalsIgnoreCase("termsAndConditions") ? 'active' : ''}">
                    <g:link controller="categories" action="termsAndConditions">
                        <g:message code="terms.and.conditions.label" default="Όροι" />
                    </g:link>
                </li>
                <li class="${controllerName?.equalsIgnoreCase("categories") && actionName?.equalsIgnoreCase("comms") ? 'active' : ''}">
                    <g:link controller="categories" action="comms">
                        Επικοινωνία
                    </g:link>
                </li>
            </ul>
        </div>
    </div>
%{--</div>--}%