<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Home/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCPH" runat="server">

    <script type="text/javascript">

        function FeedbackCtrl($scope, $http) {

            $http({ method: "GET", url: "/AllFeedsTR" }).success(function (data) {

                $scope.feeds = data;

            });

            $scope.setFeed = function (id) {

                for (var i = 0; i < $scope.feeds.length; i++) {

                    if ($scope.feeds[i].ID == id) {
                        $scope.feed = $scope.feeds[i];
                    }
                }

                $scope.setColors();
                document.getElementById("slot" + id).style.backgroundColor = "gray";
                if ($scope.feed.Image) {
                    document.getElementById("hasimg").checked = true;
                    document.getElementById("imgurl").disabled = false;
                }
                else {
                    document.getElementById("hasimg").checked = false;
                    document.getElementById("imgurl").disabled = true;
                }
            }

            $scope.checkImage = function () {

                if (document.getElementById("hasimg").checked) {
                    document.getElementById("imgurl").disabled = false;
                }
                else {
                    document.getElementById("imgurl").disabled = true;
                }

            };

            $scope.setColors = function () {

                for (var i = 0; i < $scope.feeds.length; i++) {

                    if (i % 2 == 0)
                        document.getElementById("slot" + $scope.feeds[i].ID).style.backgroundColor = "#f9f9f9";
                    else
                        document.getElementById("slot" + $scope.feeds[i].ID).style.backgroundColor = "transparent";

                }

            };

            $scope.save = function () {

                $http({ method: "POST", url: "/SaveFeedbackTR", data: $scope.feed }).success(function (data) {

                    if (data)
                        Toast("", "Info", "Feedback saved succesfully...", 2000);
                    else
                        Toast("", "Info", "Problem saving the feedback...", 2000);
                });

            };

        }

    </script>

    <style type="text/css">
        #props input
        {
            width: 95%;
            margin-bottom: 0px;
        }

        #props tr .rightCol
        {
            text-align: center;
            vertical-align: middle;
        }

        #props tr .leftCol
        {
            text-align: right;
            width: 150px;
            vertical-align: middle;
        }

        #slots tr td:hover
        {
            cursor: pointer;
        }

        #slots tr td
        {
            background-color: transparent;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyCPH" runat="server">
    <div ng-controller="FeedbackCtrl">
        <div style="width: 750px; height: 50px;">
            <button class="btn" ng-click="save()" style="float: left; margin-right: 10px;">Save</button>
        </div>
        <table id="slots" class="table table-bordered table-striped" style="width: 150px; float: left;">
            <thead>
                <tr>
                    <th>Slots</th>
                    <th>OnAir</th>
                </tr>
            </thead>
            <tr ng-repeat="feed in feeds" id="slot{{feed.ID}}">
                <td style="text-align: center;" ng-click="setFeed(feed.ID)">{{feed.ID}}</td>
                <td style="text-align: center;" ng-click="setFeed(feed.ID)">
                    <input type="checkbox" ng-model="feed.OnAir" />
                </td>
            </tr>
        </table>
        <table id="props" class="table table-bordered table-striped" style="width: 600px; margin-left: 200px;">
            <thead>
                <tr>
                    <th>Properties</th>
                    <th>Values</th>
                </tr>
            </thead>
            <tr>
                <td class="leftCol">Image:</td>
                <td class="rightCol">
                    <input id="hasimg" type="checkbox" ng-model="feed.Image" ng-click="checkImage()" /></td>
            </tr>
            <tr>
                <td class="leftCol">Image Url:</td>
                <td class="rightCol">
                    <input id="imgurl" type="text" ng-model="feed.ImageUrl" /></td>
            </tr>
            <tr>
                <td class="leftCol">Text:</td>
                <td class="rightCol">
                    <input type="text" ng-model="feed.Text" /></td>
            </tr>
            <tr>
                <td class="leftCol">Author:</td>
                <td class="rightCol">
                    <input type="text" ng-model="feed.Author" /></td>
            </tr>
            <tr>
                <td class="leftCol">Company:</td>
                <td class="rightCol">
                    <input type="text" ng-model="feed.Company" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
