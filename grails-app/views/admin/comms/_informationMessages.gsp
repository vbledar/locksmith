<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 6/13/14
  Time: 15:28
--%>

<div class="row white-font-color">
    <div class="col-sm-12">
        <h3 class="pull-left"><g:message code="admin.information.messages.label" default="Διαχείριση Μηνυμάτων" /></h3>
        <button id="show-create-message-dialog" class="btn btn-sm btn-primary pull-right self-up-separator20 self-down-separator10">
            <span class="glyphicon glyphicon-plus"></span>
            <g:message code="admin.information.message.add.label" default="Προσθήκη Πληροφοριακού" />
        </button>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="full-line"></div>
    </div>
</div>

<div class="row white-font-color">
    <div class="col-sm-12">
        <g:if test="${informationMessages?.isEmpty()}">
            <h5><g:message code="admin.information.message.list.empty" default="Δεν έχετε δημιουργήσει πληροφοριακά μηνύματα." /></h5>
        </g:if>
        <g:else>
            <g:render template="comms/informationMessagesList" model="[informationMessages: informationMessages]" />
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
