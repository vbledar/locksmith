<div class="row">
    <div class="col-sm-12">

        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <g:link class="navbar-brand" controller="admin" action="index">
                        <g:message code="admin.administration.label" default="Διαχειριστής"/>
                    </g:link>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="${controllerName.equalsIgnoreCase("admin") && actionName.equalsIgnoreCase("parentCategories") ? 'active' : ''}">
                            <g:link controller="admin" action="parentCategories">
                                <g:message code="admin.parent.categories.label" default="Κατηγορίες"/>
                            </g:link>
                        </li>
                        <li class="${controllerName.equalsIgnoreCase("admin") && actionName.equalsIgnoreCase("childCategories") ? 'active' : ''}">
                            <g:link controller="admin" action="childCategories">
                                <g:message code="admin.child.categories.label" default="Υποκατηγορίες"/>
                            </g:link>
                        </li>
                        <li class="${controllerName.equalsIgnoreCase("admin") && actionName.equalsIgnoreCase("categoryItems") ? 'active' : ''}">
                            <g:link controller="admin" action="categoryItems">
                                <g:message code="admin.items.label" default="Αντικείμενα"/>
                            </g:link>
                        </li>
                        <li class="${controllerName.equalsIgnoreCase("admin") && actionName.equalsIgnoreCase("areas") ? 'active' : ''}">
                            <g:link controller="admin" action="areas">
                                <g:message code="admin.areas.label" default="Περιοχές"/>
                            </g:link>
                        </li>
                        <li class="${controllerName.equalsIgnoreCase("admin") && actionName.equalsIgnoreCase("communicationManagement") ? 'active' : ''}">
                            <g:link controller="admin" action="communicationManagement">
                                <g:message code="admin.communication.label" default="Πληροφοριακά"/>
                            </g:link>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" id="spinner" style="display: none">
                                <g:img dir="images" file="spinner.gif" style="width: 18px; height: 18px;" />
                            </a>
                        </li>
                    </ul>
                </div>


            </div>
        </nav>
    </div>
</div>