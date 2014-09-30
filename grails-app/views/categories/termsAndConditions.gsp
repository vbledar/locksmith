<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/17/14
  Time: 13:54
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <title>
        <g:message code="terms.and.conditions.label" default="Όροι" />
    </title>
</head>

<body>

    <ul class="nav nav-tabs nav-justified">
        <li class="active">
            <a href="#terms" data-toggle="tab">Όροι Χρήσης</a>
        </li>
    </ul>

<div class="spacer20"></div>
<div class="tab-content">
    <div class="tab-pane active info-panel text-justify" id="terms">
        <g:render template="/comms/usage/terms" />
    </div>
</div>
</body>
</html>