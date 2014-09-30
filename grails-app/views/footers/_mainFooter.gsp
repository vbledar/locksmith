<g:set var="parentCategories" value="${org.locksmith.category.Category?.getParentCategories()}" />

<div class="full-line-footer">
    <div class="content_without_shadow">
        <div class="row text-left" style="padding-left: 25px; padding-right: 25px;">
            <g:each in="${parentCategories}" status="i" var="parentCategory">
                <div class="white-font-color footer-map-title-font col-sm-${(int) (10 / parentCategories?.size())}">
                    <h5 style="font-size: 16px; font-weight: bold; color: dimgray; text-shadow: 1px 1px 1px black;">${parentCategory?.name}</h5>
                    <g:each in="${parentCategory?.children}" status="j" var="childCategory">
                        <g:link controller="categories" action="parentCategoryView" params="['parent': parentCategory?.id, 'child': childCategory?.id]" data-toggle="tooltip" data-placement="top" title='${child?.description}'>
                            <h6 class="footer-map-font">${childCategory?.name}</h6>
                        </g:link>
                    </g:each>
                </div>
            </g:each>
            <div class="col-sm-3 white-font-color">
                <h5 style="font-size: 16px; font-weight: bold; color: dimgray; text-shadow: 1px 1px 1px black;" class="footer-map-title-font">
                    <g:message code="communication.label" default="Επικοινωνία" />
                </h5>

                <button id="show-contact-us-dialog" class="btn btn-sm btn-primary show-contact-us-dialog" style="width: 100%">
                    <span class="glyphicon glyphicon-envelope"></span>
                    <g:message code="contact.us.button.label" default="Επικοινωνήστε Μαζί Μας" />
                </button>

                <div class="spacer5"></div>

                <button id="show-comment-dialog" class="btn btn-sm btn-primary show-comment-dialog" style="width: 100%;">
                    <span class="glyphicon glyphicon-pencil"></span>
                    <g:message code="comment.button.label" default="Αφήστε Σχόλιο" />
                </button>

                <div class="spacer20"></div>

                <h5 style="font-size: 16px; font-weight: bold; color: dimgray; text-shadow: 1px 1px 1px black;">
                    <g:message code="social.label" default="Follow Us" />
                </h5>

                <g:img dir="/images" file="facebook.png" style="width: 75px; height: 75px" />
            </div>
        </div>
    </div>
</div>

<g:render template="/comms/contactUsDialog" />

<g:render template="/comms/leaveComment" />

<g:javascript>

    $(function() {
        $('.show-contact-us-dialog').off('click').on('click', function(event) {
            event.preventDefault();
            $('#contact-dialog').modal('show');
        });

        $('.show-comment-dialog').off('click').on('click', function(event) {
            event.preventDefault();
            $('#comment-dialog').modal('show');
        });
    })

</g:javascript>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');


    <g:if env="production">
        ga('create', 'UA-51796275-2', '109.74.203.247:8181');
    </g:if>
    <g:elseif env="development">
        ga('create', 'UA-51796275-2', '109.74.203.247:8181');
    </g:elseif>
    <g:elseif env="test">
        ga('create', 'UA-51796275-1', 'no-ip.biz');
    </g:elseif>

    ga('send', 'pageview');
</script>