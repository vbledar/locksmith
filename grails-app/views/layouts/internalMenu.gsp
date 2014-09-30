<g:applyLayout name="main">
    <head>
        <title><g:layoutTitle default="Locksmith"/></title>
        <g:layoutHead/>
    </head>
    <body>

        %{--<div class="container">--}%
            <div class="row">
                <div class="col-sm-3">
                    <g:pageProperty name="page.internalMenu" />
                </div>
                <div class="col-sm-9">
                    <g:layoutBody/>
                </div>
            </div>
        %{--</div>--}%

    </body>
</g:applyLayout>