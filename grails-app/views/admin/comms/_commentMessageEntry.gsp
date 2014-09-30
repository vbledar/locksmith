<tr id="comment-message-row-${commentMessage?.id}">
    <td class="table-cell-display-middle">
        ${commentMessage?.username}
    </td>

    <td class="table-cell-display-middle">
        ${commentMessage.message}
    </td>

    <td class="table-cell-display-middle">
        <g:formatDate date="${commentMessage?.dateCreated}" type="datetime" style="LONG" timeStyle="SHORT"/>
    </td>

    <td class="table-cell-display-middle">
        <g:formatDate date="${commentMessage?.lastUpdated}" type="datetime" style="LONG" timeStyle="SHORT"/>
    </td>

    <td class="table-cell-display-middle">
        %{--<g:link controller="admin" action="showItem" id="${item?.id}" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="${message (code: 'button.view.item.tooltip', default:'Επιλέξτε για να δείτε περισσότερες πληροφορίες.')}">--}%
        %{--<span class="glyphicon glyphicon-eye-open"></span>--}%
        %{--</g:link>--}%
        <button class="btn btn-danger delete-comment-message-button" comment-message-id="${commentMessage?.id}" data-toggle="tooltip" data-placement="top" title='<g:message code="button.delete.information.message.tooltip" default="Επιλέξτε για να διαγράψετε το σχόλιο." />'>
            <span class="glyphicon glyphicon-remove"></span>
        </button>
    </td>
</tr>


<script type="application/javascript">

    $(function() {

        $('.delete-comment-message-button').off('click').on('click', function(event) {
            // prevent default behaviour
            event.preventDefault();

            // generate parameters array
            var parameters = {};
            parameters.commentMessageId = $(this).attr('comment-message-id');

            // generate action url
            var actionUrl = '${createLink( controller: 'admin', action: 'ajaxDeleteCommentMessage')}';

            // execute ajax request
            execARWithSuccessAndErrorCallbacks(event, $(this), actionUrl, parameters, deleteCMSuccess, deleteCMFailure);
        });
    });

    // delete item success handler
    function deleteCMSuccess(event, element, data) {
        console.log(data)
        if (data.success == true) {
            // retrieve item id
            var commentMessageId = $(element).attr('comment-message-id');
            console.log(commentMessageId);

            // hide and then remove element
            $('#comment-message-row-'+commentMessageId).slideToggle(100, function(event) {
                console.log('removing record')
                $(this).remove();
            });
        } else {
            console.log(data.message);
        }
    }
    // delete item failure handler
    function deleteCMFailure(message) {
        console.log(message);
    }

</script>