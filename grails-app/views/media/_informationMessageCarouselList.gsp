<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <g:each in="${informationMessages}" status="i" var="informationMessage">
            <g:if test="${i == 0}">
                <li data-target="#carousel-example-generic" data-slide-to="${i}" class="active"></li>
            </g:if>
            <g:else>
                <li data-target="#carousel-example-generic" data-slide-to="${i}"></li>
            </g:else>
        </g:each>
    </ol>

    <!-- Render actual items -->
    <div class="carousel-inner white-font-color" style="width: 80%; margin-left: auto; margin-right: auto;">
        <g:each in="${informationMessages}" status="i" var="informationMessage">
            <g:render template="/media/informationMessageCarouselEntry" model="[informationMessage: informationMessage, index: i]" />
        </g:each>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>