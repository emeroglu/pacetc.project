<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Home/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadCPH" runat="server">
    <script type="text/javascript">

        function StatsCtrl($scope, $http) {

            $http({ method: "GET", url: "/AllStats" }).success(function (data) {

                $scope.stats = data;

            });

        }

    </script>

    <style type="text/css">
        #stats tr th
        {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyCPH" runat="server">
    <div ng-controller="StatsCtrl">              

        <table id="stats" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Page</th>
                    <th>Country</th>
                    <th>Region</th>
                    <th>City</th>
                    <th>From Mobile</th>
                    <th>Mobile OS</th>
                    <th>Mobile Model</th>
                    <th>Browser</th>
                </tr>
            </thead>
            <tr ng-repeat="stat in stats">
                <td style="text-align: center;">{{stat.Date}}</td>
                <td style="text-align: center;">{{stat.Time}}</td>
                <td style="text-align: center;">{{stat.Page}}</td>
                <td style="text-align: center;">{{stat.Country}}</td>
                <td style="text-align: center;">{{stat.Region}}</td>
                <td style="text-align: center;">{{stat.City}}</td>
                <td style="text-align: center;">
                    <input type="checkbox" ng-model="stat.Mobile" /></td>
                <td style="text-align: center;">{{stat.MobileOS}}</td>
                <td style="text-align: center;">{{stat.MobileModel}}</td>
                <td style="text-align: center;">{{stat.Browser}}</td>
            </tr>
        </table>
    </div>
</asp:Content>
