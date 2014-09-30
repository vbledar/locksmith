<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Καλώς Ήρθατε</title>
	</head>
	<body>

        %{--<div class="container">--}%

            <div class="row">
                <div class="col-sm-12">
                    <h4>
                        Κείμενο
                    </h4>

                    <p>
                        Παράγραφος
                    </p>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-8">
                    <h4 class="white-font-color">
                        Επικοινωνήστε μαζί μας...
                    </h4>

                    <div class="info-panel white-font-color">
                        <div class="row text-left">
                            <label style="font-size: 14px; font-weight: normal; color: darkorange">Τηλέφωνα Επικοινωνίας</label>
                        </div>

                        <div class="full-line"></div>

                        <div class="row">
                            <div class="col-sm-3 hidden-xs text-right">
                                <span class="glyphicon glyphicon-phone-alt"></span>
                                <label>:</label>
                            </div>

                            <div class="col-sm-3 visible-xs text-left">
                                <span class="glyphicon glyphicon-phone-alt"></span>
                                <label>:</label>
                            </div>

                            <div class="col-sm-4 text-left">
                                <label>210-61-44-444</label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3 hidden-xs text-right">
                                <span class="glyphicon glyphicon-phone"></span>
                                <label>:</label>
                            </div>

                            <div class="col-sm-3 visible-xs text-left">
                                <span class="glyphicon glyphicon-phone"></span>
                                <label>:</label>
                            </div>

                            <div class="col-sm-4 text-left">
                                <label>697-23-19-104</label>
                            </div>
                        </div>

                        <div class="spacer10"></div>

                        <label style="font-size: 8px">*Μπορείτε να μας καλείτε 24 ώρες το 24 ωρο 7 ημέρες την βδομάδα.</label>
                    </div>

                    <div class="spacer20"></div>

                    <div class="spacer20"></div>

                    <div class="info-panel white-font-color">
                        <div class="row text-left">
                            <label style="font-size: 14px; font-weight: normal; color: darkorange">Άλλοι Τρόποι Επικοινωνίας</label>
                        </div>

                        <div class="full-line"></div>

                        <div class="row">
                            <div class="col-sm-3 hidden-xs text-right">
                                <span class="glyphicon glyphicon-envelope"></span>
                                <label>Email :</label>
                            </div>

                            <div class="col-sm-3 visible-xs text-left">
                                <span class="glyphicon glyphicon-envelope"></span>
                                <label>Email :</label>
                            </div>

                            <div class="col-sm-4 text-left">
                                <label>kleidaras.pefki@gmail.com</label>
                            </div>
                        </div>

                        <div class="spacer10"></div>

                        <div class="row">
                            <div class="col-sm-12">
                                <label style="font-size: 8px">*Θα προσπαθήσουμε να σας απαντήσουμε όσο το δυνατόν γρηγορότερα. Για άμεσες ανάγκες παρακαλώ επικοινωνήστε μαζί μας στα τηλέφωνα που θα βρείτε στην ενότητα "Τηλέφωνα Επικοινωνίας".</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-sm-4">
                    <g:if test="${commentMessages?.size() > 0}">
                        <g:render template="/comms/commentMessageList" model="[commentMessages: commentMessages]" />
                    </g:if>
                </div>
            </div>
            %{-- User comments carousel --}%
            %{--<g:if test="${commentMessages?.size() > 0}">--}%
                %{--<div class="spacer20"></div>--}%
%{----}%
                %{--<div class="info-panel">--}%
                    %{--<div class="col-sm-12">--}%
                        %{--<g:render template="/comms/commentMessageList" model="[commentMessages: commentMessages]" />--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</g:if>--}%

            <div class="spacer20"></div>

            <div class="row">
                <div class="col-sm-12 white-font-color">
                    <h4>
                        <g:message code="information.message.label" default="Χρήσιμες Πληροφορίες" />
                    </h4>
                </div>
            </div>
            <g:if test="${!informationMessages}">
                <label>No information messages to show</label>
            </g:if>
            <div class="row info-panel">
                <div class="col-sm-12">
                    <g:render template="/media/informationMessageCarouselList" model="[informationMessages: informationMessages]" />
                </div>
            </div>

        %{--</div>--}%
	</body>
</html>
