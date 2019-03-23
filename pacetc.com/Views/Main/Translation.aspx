<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace | Translation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <style type="text/css">
        .unordered li i:before
        {
            margin-right: 10px;
        }

        .two-third
        {
            padding-right: 100px;
        }

        .one-half img
        {
            margin-top: 50px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyCPH" runat="server">
    <div class="light-wrapper">
        <div class="inner">
            <div class="one-half">
                <h1>Translation and Editing Division</h1>
                <br />
                <p>Our Translation Division works with many leading domestic and multi-national corporations. Working with a team of Turkish translators, each of them an expert in their field, we specialize in Turkish to English translation in a range of fields.</p>                
                These include:
                <ul class="unordered">
                    <li><i class="icon-export"></i>Annual export analyses</li>
                    <li><i class="icon-folder"></i>Annual reports</li>
                    <li><i class="icon-flight-1"></i>Monthly in-flight magazines</li>
                    <li><i class="icon-picture"></i>Fashion magazines and publications</li>
                    <li><i class="icon-thumbs-up"></i>Translations for localization firms</li>
                    <li><i class="icon-briefcase"></i>Legal documents</li>
                    <li><i class="icon-money"></i>Financial documents</li>
                    <li><i class="icon-mobile"></i>Technological documents</li>
                    <li><i class="icon-book-1"></i>Books on a variety of topics</li>
                    <li><i class="icon-monitor"></i>Websites</li>
                    <li>And more …</li>
                </ul>                
            </div>
            <div class="one-half last">                
                 <img src="/Client/images/photo.JPG" />
            </div>
            <div class="clear"></div>
            <div class="one-full"> 
                <p>Every translation is meticulously edited by a native speaker with experience of editing across the board. Our goal is to return a document that reads as though it were originally written in English by a native speaker, with all the accompanying style and flair.</p>                               
                <p>We also firmly believe in close cooperation with the client, in order to produce the best possible results. This includes suggestions or recommendations on how an expression or word may be improved, or any possible amendments to put out the perfect result. Our assumption is that the final reader will be a person of proficient or native level of English.</p>
            </div>            
            <div class="clear"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">
</asp:Content>
