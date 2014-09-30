<!-- Wrapper for slides -->
<g:if test="${index == 0}">
    <div class="item active" style="min-height: 200px;">
</g:if>
<g:else>
    <div class="item" style="min-height: 200px;">
</g:else>
    <img src="${createLink(controller: 'admin', action: 'showItemPhoto', id: informationMessage?.photo?.id)}" alt="">
    <div class="carousel-caption" style="width: 70%;">
        <h3>${informationMessage?.title}</h3>
        <p style="overflow-x: hidden; overflow-y: scroll;">${informationMessage?.message}</p>
    </div>
</div>