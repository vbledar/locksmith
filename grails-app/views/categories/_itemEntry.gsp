<div class="row info-panel">
    <div class="col-sm-12">

        <div class="row white-font-color">
            <div class="col-sm-12">
                <h4>
                    ${item?.name}
                </h4>
            </div>
        </div>

        <div class="full-line"></div>

        <div class="spacer10"></div>

        <div class="row">
            <div class="col-sm-4">
                <g:if test="${item && item.photos && item.photos.size() > 0}">
                    <img class="image125 img-thumbnail" src="${createLink(controller: 'admin', action: 'showItemPhoto', id: item?.getFirstPhoto()?.id)}" />
                </g:if>
                <g:else>
                    <g:message code="no.image.upload" default="Χωρίς"/>
                </g:else>
            </div>

            <div class="col-sm-8 white-font-color">
                <div class="row text-left">
                    <div class="col-sm-12">
                        <h6 style="text-decoration: underline">
                            <g:message code="field.price.label" default="Τιμή"/>
                        </h6>
                        <h5>
                            ${item?.price} &euro;
                        </h5>
                    </div>

                    <div class="col-sm-12">
                        <h6 style="text-decoration: underline">
                            <g:message code="field.description.label" default="Περιγραφή"/>
                        </h6>
                        <h5>
                            ${item?.description}
                        </h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="spacer20"></div>