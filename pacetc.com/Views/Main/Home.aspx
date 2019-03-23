<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <link href="/Client/css/home.css" rel="stylesheet" />
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
    <br />
    <div id="ourcourses" class="light-wrapper" style="border-bottom: 3px solid rgba(1, 46, 111, 0.8);">
        <div class="inner">
            <h1>Our Courses</h1>
            <p class="description">Our Training Division runs high-end courses that specialize in specific business and language areas, and combine a wealth of business, teaching and NLP experience.</p>
            <br />
            <div class="services">
                <div class="one-half">
                    <i class="icon-users special"></i>
                    <div class="info">
                        <h3>Meeting Techniques</h3>
                        <p>How often have you attended a meeting that you felt was not achieving its goal efficiently, or even not at all? How often have you felt that somehow people who should be striving towards the same outcome are working at complete odds with one another? If you, like us, find yourself totally bored or frustrated at meetings, then perhaps we can work together to accomplish a new approach.</p>
                    </div>
                </div>
                <div class="one-half last">
                    <i class="icon-pencil special"></i>
                    <div class="info">
                        <h3>Professional Writing Skills</h3>
                        <p>Do you need to improve your writing in English (and in Turkish)? Want to continue your work at an even more successful level, or move on to new things? This course, using NLP techniques, aims to teach you the skills to bring your writing to a whole new level, whether your goal is to advance your career, or to adjust to the changing demands of the workplace.</p>
                    </div>
                </div>
                <div class="clear"></div>
                <br />
                <div class="one-half">
                    <i class="icon-megaphone-1 special"></i>
                    <div class="info">
                        <h3>Presentation Skills</h3>
                        <p>How often have you attended a presentation or seminar and found yourself wishing that it would just end … now! Lots of professionals have huge amounts of knowledge and experience, and we can learn so much from them. But so many of them do not know how to present their topic properly.</p>
                    </div>
                </div>
                <div class="one-half last">
                    <i class="icon-graduation-cap special"></i>
                    <div class="info">
                        <h3>Fast Acquisition of Spoken English</h3>
                        <p>A revolutionary new method to unlock students’ speaking capacity. Pace TC has identified 5 key points to help non-native English Speakers open up their speaking ability.</p>
                    </div>
                </div>
                <div class="clear"></div>
                <br />
            </div>
        </div>
    </div>
    <div class="dark-wrapper">
        <div class="inner">
            <div id="testimonials" class="tab-container">
                <div class="panel-container">                    
                    <%: Html.Raw(ViewBag.Testimonials) %>
                </div>
                <ul class="etabs">
                    <%: Html.Raw(ViewBag.Tabs) %>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">
</asp:Content>
