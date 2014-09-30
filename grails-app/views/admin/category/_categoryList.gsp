<g:each in="${categories}" status="i" var="category">
    <g:render template="category/categoryEntry" model="[category: category, index: i]" />
</g:each>