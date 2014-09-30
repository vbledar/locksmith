<tr id="item-row-${item?.id}">
    <td style="display: table-cell; vertical-align: middle">
        <g:if test="${item && item.photos && item.photos.size() > 0}">
            <img class="image75 img-thumbnail" src="${createLink(controller: 'admin', action: 'showItemPhoto', id: item?.getFirstPhoto()?.id)}" />
        </g:if>
        <g:else>
            <g:message code="no.image.upload" default="Χωρίς" />
        </g:else>
    </td>
    <td class="table-cell-display-middle">
        ${item?.name}
    </td>

    <td class="table-cell-display-middle">
        ${item?.price}
    </td>

    <td class="table-cell-display-middle">
        ${item?.category?.name}
    </td>

    <td class="table-cell-display-middle">
        ${item?.subcategory?.name}
    </td>

    <td class="table-cell-display-middle">
        <g:if test="${item.visible}">
            <g:message code="enum.value.yes" default="Ναι" />
        </g:if>
        <g:else>
            <g:message code="enum.value.no" default="Oχι" />
        </g:else>
    </td>

    <td class="table-cell-display-middle">
        <g:link controller="admin" action="showItem" id="${item?.id}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="${message (code: 'button.view.item.tooltip', default:'Επιλέξτε για να δείτε περισσότερες πληροφορίες.')}">
            <span class="glyphicon glyphicon-eye-open"></span>
        </g:link>
        <button class="btn btn-danger delete-item-button" item-id="${item?.id}" data-toggle="tooltip" data-placement="top" title='<g:message code="button.delete.item.tooltip" default="Επιλέξτε για να διαγράψετε το αντικείμενο." />'>
            <span class="glyphicon glyphicon-remove"></span>
        </button>
    </td>
</tr>


<script type="application/javascript">

    $(function() {

        $('.delete-item-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // generate parameters array
            var parameters = {};
            parameters.itemId = $(this).attr('item-id');

            // generate action url
            var actionUrl = '${createLink( controller: 'admin', action: 'ajaxDeleteItem')}';

            // execute ajax request
            execARWithSuccessAndErrorCallbacks(event, $(this), actionUrl, parameters, deleteItemSuccess, deleteItemFailure);
        });
    });

    // delete item success handler
    function deleteItemSuccess(event, element, data) {
        if (data.success == true) {
            // retrieve item id
            var itemId = $(element).attr('item-id');

            // hide and then remove element
            $('#item-row-'+itemId).slideToggle(100, function(event) {
                $(this).remove();
            });
        } else {
            console.log(data.message);
        }
    }

    // delete item failure handler
    function deleteItemFailure(message) {
        console.log(message);
    }

</script>