<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/13/14
  Time: 15:28
--%>

<div class="row white-font-color">
    <div class="col-sm-12">
        <h3 class="pull-left"><g:message code="admin.comment.messages.label" default="Διαχείριση Σχολίων" /></h3>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="full-line"></div>
    </div>
</div>

<div class="row white-font-color">
    <div class="col-sm-12">
        <g:if test="${commentMessages?.isEmpty()}">
            <h5><g:message code="admin.comment.message.list.empty" default="Δεν έχουν δημιουργηθεί σχόλια." /></h5>
        </g:if>
        <g:else>
            <g:render template="comms/commentMessagesList" model="[commentMessages: commentMessages]" />
        </g:else>
    </div>
</div>

<g:render template="comms/dialog/createInformationMessageDialog"/>

<g:javascript>
    $(function() {
        $('#show-create-message-dialog').off('click').on('click', function(event) {
            $('#create-information-message-dialog').modal('show');
        });
    });
</g:javascript>
