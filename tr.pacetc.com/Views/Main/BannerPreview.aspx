<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <link href="/Client/css/home.css" rel="stylesheet" />
    <style type="text/css">
        #contact
        {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyCPH" runat="server">
    <div class="bannercontainer">
        <div class="banner">
            <ul>                
                <%: Html.Raw(ViewBag.Banner) %>
            </ul>
            <div class="tp-bannertimer tp-bottom"></div>
        </div>
    </div>    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">
</asp:Content>

