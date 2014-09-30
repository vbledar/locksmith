<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/17/14
  Time: 16:23
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        <g:message code="admin.communication.title" default="Διαχείριση Επικοινωνίας" />
    </title>
</head>

<body>

<div class="row">
    <div class="col-sm-12">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#message" data-toggle="tab">Μηνύματα</a>
            </li>
            <li>
                <a href="#comment" data-toggle="tab">Σχόλια</a>
            </li>
        </ul>
    </div>
</div>

<!-- Tab panes -->
<div class="tab-content">
    <div class="tab-pane active" id="message">
        <div class="row">
            <div class="col-sm-12">
                <g:render template="comms/informationMessages" />
            </div>
        </div>
    </div>
    <div class="tab-pane" id="comment">
        <div class="row">
            <div class="col-sm-12">
                <g:render template="comms/commentMessages" />
            </div>
        </div>
    </div>
</div>
</body>
</html>