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

<h4 class="white-font-color">${item?.name}</h4>

<div class="full-line"></div>


<div class="row white-font-color self-up-separator20">
    <g:each in="${item?.photos}" status="i" var="photo">
        <div class="col-sm-3">
            <div id="image-show-${index}" class="image-upload-holder text-center" style="margin-left: auto; margin-right: auto;">
                <img class="image75 img-thumbnail" src="${createLink(controller: 'admin', action: 'showItemPhoto', id: photo?.id)}" />
            </div>

            <g:set var="lastIndex" value="${i+1}"/>
        </div>
    </g:each>

    <g:each in="${(lastIndex..3)}" status="i" var="index">
        <div class="col-sm-3">
        </div>
    </g:each>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="full-line-black"></div>
    </div>
</div>

<g:form name="item-creation-form" controller="admin" action="updateItem" id="${item?.id}">
    <div class="row white-font-color">
        <div class="col-sm-12">
            <div class="form-group">
                <label for="name">
                    <g:message code="field.name.label" default="Όνομα"/>
                </label>
                <input type="text" class="form-control col-sm-5" id="name" name="name" value="${item?.name}"
                       placeholder="${message(code: 'field.name.place.holder.value', default: 'Εισαγωγή ονόματος')}">
            </div>
        </div>

        <div class="col-sm-12">
            <div class="form-group">
                <label for="description">
                    <g:message code="field.description.label" default="Περιγραφή"/>
                </label>
                <g:textArea name="description"
                            class="form-control"
                            rows="5"
                            cols="20"
                            value="${item?.description}"
                            placeholder="${message(code: 'field.description.place.holder.value', default: 'Εισαγωγή περιγραφής')}"
                            style="resize: none"/>
            </div>
        </div>
    </div>

    <div class="row white-font-color">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="price">
                    <g:message code="field.price.label" default="Τιμή"/>
                </label>
                <input id="price"
                       name="price"
                       type="number"
                       class="form-control"
                       value="${item?.price}"
                       placeholder="${message(code: 'field.price.place.holder.value', default: 'Εισαγωγή τιμής')}">
            </div>
        </div>

        <div class="col-sm-6 text-left">
            <div class="form-group" style="padding-top: 20px;">
                <div class="col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input name="visible" type="checkbox" ${item.visible ? "checked='true'" : ""}> <g:message code="field.visible.label"
                                                                                             default="Κατηγορία ορατή?"/>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row white-font-color">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="category">
                    <g:message code="field.category.label" default="Κατηγορία"/>
                </label>
                <g:select id="item-parent-category"
                          name="category"
                          class="form-control"
                          from="${parentCategories}"
                          optionKey="id"
                          value="${item?.category?.id}"/>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="form-group">
                <label for="subcategory">
                    <g:message code="field.sub.category.label" default="Υπό-Κατηγορία"/>
                </label>

                <div class="child-categories-container">
                    <g:select name="subcategory"
                              class="form-control"
                              from="${childCategories}"
                              optionKey="id"
                              value="${item?.subcategory?.id}"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="full-line"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 text-right">
            <g:link controller="admin" action="categoryItems" class="btn btn-danger">
                <g:message code="close.button.label" default="Ακύρωση" />
            </g:link>
            <button class="btn btn-primary" type="submit">
                <g:message code="update.button.label" default="Ενημέρωση"/>
            </button>
        </div>
    </div>
</g:form>


</body>
</html>