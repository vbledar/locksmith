<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <r:require modules="application, bootstrap, bootstrap-file-upload"/>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

    <g:layoutHead/>
    <r:layoutResources />
</head>
<body class="content">

    <!-- Central administration menu -->
    <g:render template="/admin/menus/adminCentralMenu" />

    <g:layoutBody/>
    <r:layoutResources />
</body>
</html>