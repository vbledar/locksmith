<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Cache-Control" content="max-age=3600">

		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href='http://fonts.googleapis.com/css?family=Lato|Playfair+Display|PT+Sans+Narrow|Bitter|Droid+Serif|Open+Sans|Oswald|Roboto+Condensed|Montserrat&subset=latin,greek-ext' rel='stylesheet' type='text/css'>

        <r:require modules="application, bootstrap, bxSlider"/>

		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body style="padding-top: 15px;">

        <g:render template="/headers/headerMain" />

        <div class="content" style="min-height: 760px;">

            <div class="spacer20"></div>

            <g:render template="/menus/centralMenu" />

            <div class="spacer20"></div>

            <g:layoutBody/>
        </div>

        %{--<div class="spacer20"></div>--}%

        <g:render template="/footers/mainFooter" />

        <div class="spacer10"></div>

        <g:render template="/footers/copyrightInformation" />

        <div class="spacer10"></div>

        <r:layoutResources />
	</body>
</html>