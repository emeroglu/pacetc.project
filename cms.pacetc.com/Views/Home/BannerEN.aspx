<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Home/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCPH" runat="server">
    <script type="text/javascript">

        function BannerCtrl($scope, $http) {

            $http({ method: "GET", url: "/AllBannersEN" }).success(function (data) {

                $scope.banners = data;

            });

            $scope.setBanner = function (id) {

                for (var i = 0; i < $scope.banners.length; i++) {

                    if ($scope.banners[i].ID == id) {
                        $scope.banner = $scope.banners[i];
                    }
                }

                $scope.checkTopImage($scope.banner.TopImage);
                $scope.checkBannerImage($scope.banner.BannerImage);

                $scope.setColors();
                document.getElementById("slot" + id).style.backgroundColor = "gray";

            };

            $scope.setColors = function () {

                for (var i = 0; i < $scope.banners.length; i++) {

                    if (i % 2 == 0)
                        document.getElementById("slot" + $scope.banners[i].ID).style.backgroundColor = "#f9f9f9";
                    else
                        document.getElementById("slot" + $scope.banners[i].ID).style.backgroundColor = "transparent";

                }

            };

            $scope.checkTopImage = function (bool) {

                document.getElementById("txtTitle").disabled = bool;

                document.getElementById("txtTopImageUrl").disabled = !bool;
                document.getElementById("txtTopImageWidth").disabled = !bool;

            };

            $scope.checkBannerImage = function (bool) {

                document.getElementById("txtBannerImageUrl").disabled = !bool;
                document.getElementById("txtBannerImageWidth").disabled = !bool;

            };

            $scope.save = function () {

                $http({ method: "POST", url: "/SaveBannerEN", data: $scope.banner }).success(function (data) {

                    if (data)
                        Toast("", "Info", "Banner saved succesfully...", 2000);
                    else
                        Toast("", "Info", "Problem saving the banner...", 2000);
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
    <div ng-controller="BannerCtrl">
        <div style="width: 750px; height: 50px;">
            <button class="btn" ng-click="save()" style="float: left; margin-right: 10px;">Save</button>
            <a href="http://pacetc.com/BannerPreview" target="_blank">
                <div class="btn" style="float: left; margin-right: 10px;">
                    Preview
                </div>
            </a>
        </div>
        <table id="slots" class="table table-bordered table-striped" style="width: 150px; float: left;">
            <thead>
                <tr>
                    <th>Slots</th>
                    <th>On Air</th>
                </tr>
            </thead>
            <tr ng-repeat="banner in banners" id="slot{{banner.ID}}">
                <td style="text-align: center;" ng-click="setBanner(banner.ID)">{{banner.Slot}}</td>
                <td style="text-align: center;" ng-click="setBanner(banner.ID)">
                    <input type="checkbox" ng-model="banner.OnAir" /></td>
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
                <td class="leftCol">Duration:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.Duration" placeholder="Miliseconds..." /></td>
            </tr>
            <tr>
                <td class="leftCol">Title:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.Title" id="txtTitle" /></td>
            </tr>
            <tr>
                <td class="leftCol">Top Image:</td>
                <td class="rightCol">
                    <input type="checkbox" ng-model="banner.TopImage" ng-click="checkTopImage(banner.TopImage)" /></td>
            </tr>
            <tr>
                <td class="leftCol">Top Image Url:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.TopImageUrl" id="txtTopImageUrl" /></td>
            </tr>
            <tr>
                <td class="leftCol">Top Image Width:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.TopImageWidth" id="txtTopImageWidth" /></td>
            </tr>
            <tr>
                <td class="leftCol">First Caption:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.FirstCaption" /></td>
            </tr>
            <tr>
                <td class="leftCol">First Caption Size:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.FirstCaptionSize" /></td>
            </tr>
            <tr>
                <td class="leftCol">Second Caption:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.SecondCaption" /></td>
            </tr>
            <tr>
                <td class="leftCol">Second Caption Size:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.SecondCaptionSize" /></td>
            </tr>
            <tr>
                <td class="leftCol">Banner Image:</td>
                <td class="rightCol">
                    <input type="checkbox" ng-model="banner.BannerImage" ng-click="checkBannerImage(banner.BannerImage)" /></td>
            </tr>
            <tr>
                <td class="leftCol">Banner Image Url:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.BannerImageUrl" id="txtBannerImageUrl" /></td>
            </tr>
            <tr>
                <td class="leftCol">Banner Image Width:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.BannerImageWidth" id="txtBannerImageWidth" /></td>
            </tr>
            <tr>
                <td class="leftCol">Button Text:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.ButtonText" /></td>
            </tr>
            <tr>
                <td class="leftCol">Button Url:</td>
                <td class="rightCol">
                    <input type="text" ng-model="banner.ButtonUrl" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
