<div id="user-comments-carousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <g:each in="${commentMessages}" status="i" var="commentMessage">
            <g:if test="${i == 0}">
                <li data-target="#user-comments-carousel" data-slide-to="${i}" class="active"></li>
            </g:if>
            <g:else>
                <li data-target="#user-comments-carousel" data-slide-to="${i}"></li>
            </g:else>
        </g:each>
    </ol>

    <!-- Render actual items -->
    <div class="carousel-inner " style="width: 80%; margin-left: auto; margin-right: auto;">
        <g:each in="${commentMessages}" status="i" var="commentMessage">
            <g:render template="/comms/commentMessageCarouselEntry" model="[commentMessage: commentMessage, index: i]" />
        </g:each>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#user-comments-carousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#user-comments-carousel " data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>