<tr id="information-message-row-${informationMessage?.id}">
    <td class="table-cell-display-middle">
        <g:if test="${informationMessage.photo}">
            <g:message code="enum.value.yes" default="Ναι" />
        </g:if>
        <g:else>
            <g:message code="enum.value.no" default="Oχι" />
        </g:else>
    </td>
    <td class="table-cell-display-middle">
        ${informationMessage?.title}
    </td>

    <td class="table-cell-display-middle">
        <g:if test="${informationMessage.message}">
            <g:message code="enum.value.yes" default="Ναι" />
        </g:if>
        <g:else>
            <g:message code="enum.value.no" default="Oχι" />
        </g:else>
    </td>

    <td class="table-cell-display-middle">
        <g:formatDate date="${informationMessage?.dateCreated}" type="datetime" style="LONG" timeStyle="SHORT"/>
    </td>

    <td class="table-cell-display-middle">
        <g:formatDate date="${informationMessage?.lastUpdated}" type="datetime" style="LONG" timeStyle="SHORT"/>
    </td>

    <td class="table-cell-display-middle">
        <g:if test="${informationMessage.visible}">
            <g:message code="enum.value.yes" default="Ναι" />
        </g:if>
        <g:else>
            <g:message code="enum.value.no" default="Oχι" />
        </g:else>
    </td>

    <td class="table-cell-display-middle">
        %{--<g:link controller="admin" action="showItem" id="${item?.id}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="${message (code: 'button.view.item.tooltip', default:'Επιλέξτε για να δείτε περισσότερες πληροφορίες.')}">--}%
            %{--<span class="glyphicon glyphicon-eye-open"></span>--}%
        %{--</g:link>--}%
        <button class="btn btn-danger delete-information-message-button" information-message-id="${informationMessage?.id}" data-toggle="tooltip" data-placement="top" title='<g:message code="button.delete.information.message.tooltip" default="Επιλέξτε για να διαγράψετε το πληροφοριακό." />'>
            <span class="glyphicon glyphicon-remove"></span>
        </button>
    </td>
</tr>


<script type="application/javascript">

    $(function() {

        $('.delete-information-message-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // generate parameters array
            var parameters = {};
            parameters.informationMessageId = $(this).attr('information-message-id');

            // generate action url
            var actionUrl = '${createLink( controller: 'admin', action: 'ajaxDeleteInformationMessage')}';

            // execute ajax request
            execARWithSuccessAndErrorCallbacks(event, $(this), actionUrl, parameters, deleteIMSuccess, deleteIMFailure);
        });
    });

    // delete item success handler
    function deleteIMSuccess(event, element, data) {
        console.log(data)
        if (data.success == true) {
            // retrieve item id
            var informationMessageId = $(element).attr('information-message-id');
            console.log(informationMessageId);

            // hide and then remove element
            $('#information-message-row-'+informationMessageId).slideToggle(100, function(event) {
                console.log('removing record')
                $(this).remove();
            });
        } else {
            console.log(data.message);
        }
    }
    // delete item failure handler
    function deleteIMFailure(message) {
        console.log(message);
    }

</script>