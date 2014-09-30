<%--
  Created by IntelliJ IDEA.
  User: nvasili
  Date: 28/5/2014
  Time: 4:19 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Επικοινωνία</title>
    <meta name="layout" content="main"/>

    <!-- Google maps API -->
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Load the map API -->
    <script type="application/javascript">
        function initialize() {
            var myLatlng = new google.maps.LatLng(38.055586, 23.792617);
            var map_canvas = document.getElementById('map_canvas');
            var map_options = {
                center: myLatlng,
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            var map = new google.maps.Map(map_canvas, map_options)
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Η διεύθυνση μας.!'
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>

<body>

    %{--<div class="container">--}%
        <div class="info-panel white-font-color">
            <div class="row text-left">
                <label style="font-size: 14px; font-weight: normal; color: darkorange">Τηλέφωνα Επικοινωνίας</label>
            </div>

            <div class="full-line"></div>

            <div class="row">
                <div class="col-sm-3 hidden-xs text-right">
                    <span class="glyphicon glyphicon-phone-alt"></span>
                    <label>Σταθερό Τηλέφωνο :</label>
                </div>
                <div class="col-sm-3 visible-xs text-left">
                    <span class="glyphicon glyphicon-phone-alt"></span>
                    <label>Σταθερό Τηλέφωνο :</label>
                </div>

                <div class="col-sm-4 text-left">
                    <label>210-61-44-444</label>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-3 hidden-xs text-right">
                    <span class="glyphicon glyphicon-phone"></span>
                    <label>Κινητό Τηλέφωνο :</label>
                </div>
                <div class="col-sm-3 visible-xs text-left">
                    <span class="glyphicon glyphicon-phone"></span>
                    <label>Κινητό Τηλέφωνο :</label>
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

                <div class="col-sm-5 text-right">
                    <button id="show-contact-us-dialog" class="btn btn-sm btn-primary show-contact-us-dialog">
                        <span class="glyphicon glyphicon-envelope"></span>
                        <g:message code="contact.us.button.label" default="Επικοινωνήστε Μαζί Μας" />
                    </button>
                </div>
            </div>

            <div class="spacer10"></div>

            <label style="font-size: 8px">*Θα προσπαθήσουμε να σας απαντήσουμε όσο το δυνατόν γρηγορότερα. Για άμεσες ανάγκες παρακαλώ επικοινωνήστε μαζί μας στα τηλέφωνα που θα βρείτε στην ενότητα "Τηλέφωνα Επικοινωνίας".</label>
        </div>

        <div class="spacer20"></div>

        <div class="spacer20"></div>

        <div class="info-panel white-font-color">
            <div class="row text-left">
                <label style="font-size: 14px; font-weight: normal; color: darkorange">
                    Διεύθυνση
                </label>
            </div>

            <div class="full-line"></div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="spacer20"></div>

                    <div class="spacer20"></div>

                    <div class="spacer20"></div>

                    <address>
                        <h3>Κλειδαράς Ο Πέτρος</h3>

                        <h4>Χρυσοστόμου Σμύρνης 22</h4>
                        <h4>& Αθανασίου Διάκου 11</h4>
                        <h5>T.K. 12345</h5>
                        <h6>Πεύκη</h6>
                        <h6>Αττική</h6>
                    </address>
                </div>

                <div class="col-sm-6 text-center">
                    <div id="map_canvas" class="text-center">
                    </div>
                </div>
            </div>
        </div>
    %{--</div>--}%

<g:javascript>


</g:javascript>
</body>
</html>