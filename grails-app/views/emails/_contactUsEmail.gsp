<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/13/14
  Time: 13:23
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>
    <title>${contactForm?.fullname}</title>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <label class="white-font-color">
                    <g:message code="field.user.full.name.label" default="Ονοματεπώνυμο" />
                </label>

                <div class="spacer10"></div>

                <label class="white-font-color">
                    ${contactForm?.fullname}
                </label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <label class="white-font-color">
                    <g:message code="field.subject.label" default="Θέμα" />
                </label>

                <div class="spacer10"></div>

                <label class="white-font-color">
                    ${contactForm?.subject}
                </label>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <label class="white-font-color">
                    <g:message code="field.message.name.label" default="Μήνυμα" />
                </label>

                <div class="spacer10"></div>

                <p class="white-font-color">
                    ${contactForm?.message}
                </p>
            </div>
        </div>
    </div>
</body>
</html>