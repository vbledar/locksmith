%{--<div class="container">--}%

<div class="full-line-footer white-font-color">
    <div class="content_without_shadow">
        <div class="row">
            <div class="col-sm-3">
                <g:img dir="images/headers" file="shop-front.jpg"/>
            </div>

            <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="">Κλειδαράς, Ο Πέτρος</h2>
                    </div>
                    <div class="col-sm-12">
                        <h4 class="">210 61 44 444</h4>
                        <h4 class="">697 23 19 104</h4>
                    </div>
                    <div class="col-sm-12">
                        <label>Μπορείτε να μας καλείτε 24 ώρες το 24 ωρο 7 ημέρες την βδομάδα.</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="spacer20"></div>

        <div class="row">
            <div class="col-sm-12">
                <ul class="areas-list">
                    <g:each in="${org.locksmith.location.Area?.allAreas}" status="i" var="area">
                        <li>
                            ${area.name}
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
</div>

<g:javascript>

//    $('.bxslider').bxSlider({
//        minSlides: 6,
//        maxSlides: 6,
//        slideWidth: 150,
//        slideMargin: 10,
//        ticker: true,
//        speed: 10000
//    });

</g:javascript>