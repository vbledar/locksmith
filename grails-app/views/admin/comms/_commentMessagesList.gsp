<table class="table table-condensed table-striped information-messages-table">
    <tr>
        <th class="text-center">
            <g:message code="field.username.label" default="Ψευδώνυμο" />
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
            <g:message code="field.action.label" default="Ενέργειες" />
        </th>
    </tr>

    <g:each in="${commentMessages}" status="i" var="commentMessage">
        <g:render template="comms/commentMessageEntry" model="[commentMessage: commentMessage, index: i]" />
    </g:each>

</table>