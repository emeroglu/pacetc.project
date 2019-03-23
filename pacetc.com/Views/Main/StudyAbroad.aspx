<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace | Study Abroad
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <link href="/Client/css/abroad.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyCPH" runat="server">
    <div class="light-wrapper" id="abroad">
        <div class="inner">
            <h1>Study Abroad</h1>
            <br />
            <p>Everybody knows that the most effective way to fully master a language is to live that language. In other words, to spend time in an environment where the chosen language is used in every situation and all the time.</p>
            <p>Pace Training and Consultancy works closely with a select group of schools in Dublin, Ireland to offer unrivalled opportunities to perfect your English in a natural setting. We do not offer every school. We have chosen a very few partners, whom we trust implicitly to ensure that your stay is thoroughly enjoyable and highly productive.</p>
            <p>Our partner schools are widely renowned in the industry, and they offer a full range of course options, both in terms of duration and intensity, and the type of English required (business, conversation, general, etc…), as well as customized courses where necessary.</p>
            <p>Each school offers a variety of accommodation options, from hotel stay, to family accommodation, to suit every preference. They also organize various extra-curricular activities such as sports or cultural events, and even tours to other parts of Ireland (according to demand and availability).</p>
        </div>
    </div>

    <div class="light-wrapper" id="pace">
        <div class="inner">

            <div class="one-third">
                <img src="/Client/images/logo.png" style="width:80%;margin-top:25px;" />                
            </div>

            <div class="two-third last">
                <p>Pace has a special arrangement with MEI, an organization that facilitates the visa application process for foreign students in Ireland. This removes the difficulty in arranging a visa, which used to be a very frustrating and often fruitless process. Our visa arrangement covers any stay up to 24 weeks.</p>
                <p>Pace also makes every effort to work with our partner schools in allocating our clients to the most suitable family when the family accommodation option is selected. Wherever possible, we try to place the client with people from a similar professional background. Family accommodation is highly recommended because of the total exposure to English, including mealtimes, evenings, etc…</p>
            </div>
            
            <div class="clear"></div>

        </div>
    </div>

    <div class="light-wrapper">
        <!-- Begin Inner -->
        <div class="inner">
            <h1 class="aligncenter">Why Ireland?</h1>
            <br />
            <div class="grid-wrapper">
                <div class="blog-grid">
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/dublin.jpg" alt="" />
                        </div>
                        <p>Dublin, the city that gave us James Joyce, Samuel Beckett, George Bernard Shaw, and many other literary giants, is famous for its friendly atmosphere and traditional Irish hospitality. While becoming very modern in recent times, the capital city has succeeded in retaining its old-fashioned charm and small city feel.</p>
                    </div>
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/dublin2.jpg" alt="" />
                        </div>
                        <p>While there are a huge variety of cultural and historical activities available in the city itself, you are still within easy reach of the sea, the mountains and the countryside, as well as staggering prehistoric monuments just one hour away.</p>
                    </div>
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/dublin3.jpg" alt="" />
                        </div>
                        <p>Irish people take their leisure time seriously, and there is a wealth of sporting and leisure activities at your fingertips, whether to participate or spectate. You can choose quiet evenings in relaxing cafes, pubs or restaurants, or you can let your hair down at one of the huge selection of clubs around the city.</p>
                    </div>
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/dublin4.jpg" alt="" />
                        </div>
                        <p>Ireland is a very family-oriented society, and the people are extremely open and friendly. You will be amazed at how often complete strangers will smile and start talking to you, whatever the situation.</p>
                    </div>
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/airport.jpg" alt="" />
                        </div>
                        <p>With direct flights from Istanbul Atatürk to Dublin taking only 4 hours, you can reach your destination quickly and comfortably.</p>
                    </div>
                    <div class="post">
                        <div class="overlay">
                            <img src="/Client/images/dublin5.jpg" alt="" />
                        </div>
                        <p>Our special visa arrangement is unique to Ireland, thus making it one of the easiest and most stress free visa applications you will encounter in comparison with many other destinations.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Inner -->
    </div>    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">
    <script type="text/javascript">

        document.getElementById("email").innerHTML = "studyabroad@pacetc.com";

    </script>
</asp:Content>
