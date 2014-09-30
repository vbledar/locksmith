<table class="table table-condensed table-striped information-messages-table">
    <tr>
        <th class="text-center">
            <g:message code="field.photo.label" default="Φωτογραφία" />
        </th>
        <th class="text-center">
            <g:message code="field.title.label" default="Τίτλος" />
        </th>

        <th class="text-center">
            <g:message code="field.message.label" default="Μήνυμα" />
        </th>

        <th class="text-center">
            <g:message code="field.date.created.label" default="Η/Μ Δημιουργίας" />
        </th>

        <th class="text-center">
            <g:message code="field.last.updated.label" default="Η/Μ Ενημέρωσης" />
        </th>

        <th class="text-center">
            <g:message code="field.visible.label" default="Ορατό" />
        </th>

        <th class="text-center">
            <g:message code="field.action.label" default="Ενέργειες" />
        </th>
    </tr>

    <g:each in="${informationMessages}" status="i" var="informationMessage">
        <g:render template="comms/informationMessageEntry" model="[informationMessage: informationMessage, index: i]" />
    </g:each>

</table>