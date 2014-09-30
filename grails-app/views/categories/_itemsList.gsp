<g:each in="${items}" status="i" var="item">
    <g:render template="itemEntry" model="[item: item]" />
</g:each>