<h4 class="white-font-color">
    Σχόλια πελατών...
</h4>
<g:each in="${commentMessages}" status="i" var="commentMessage">
    <g:render template="/comms/commentMessageListEntry" model="[commentMessage: commentMessage, index: i]" />

    <div class="spacer15"></div>
</g:each>