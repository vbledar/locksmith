<table class="table table-condensed table-striped category-items-table">
    <tr>
        <th class="text-center">
            <g:message code="field.photo.label" default="Φωτογραφία" />
        </th>
        <th class="text-center">
            <g:message code="field.name.label" default="Όνομα" />
        </th>

        %{--<th class="text-center">--}%
            %{--<g:message code="field.description" default="Περιγραφή" />--}%
        %{--</th>--}%

        <th class="text-center">
            <g:message code="field.price.label" default="Τιμή" />
        </th>

        <th class="text-center">
            <g:message code="field.category.label" default="Κατηγορία" />
        </th>

        <th class="text-center">
            <g:message code="field.subcategory.label" default="Υπο-Κατηγορία" />
        </th>

        <th class="text-center">
            <g:message code="field.visible.label" default="Ορατό" />
        </th>

        <th class="text-center">
            <g:message code="field.action.label" default="Ενέργειες" />
        </th>
    </tr>

<g:each in="${items}" status="i" var="item">
    <g:render template="category/itemEntry" model="[item: item, index: i]" />
</g:each>

</table>