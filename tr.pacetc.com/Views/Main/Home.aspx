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
            <h1>Kurslarımız</h1>
            <p class="description">Eğitim Bölümümüz, belirli iş kolu ve dil alanlarında uzmanlaşmış yüksek kalite kurslar düzenleyerek, çeşitli iş sahaları , öğretim ve NLP deneyimini harmanlamaktadır.</p>
            <br />
            <div class="services">
                <div class="one-half">
                    <i class="icon-users special"></i>
                    <div class="info">
                        <h3>Toplantı Teknikleri</h3>
                        <p>Amacına etkin bir şekilde ulaşamadığını ya da hiç ulaşmadığını hissettiğiniz toplantılara ne sıklıkla katılıyorsunuz? Aynı amaca hizmet etmesi gereken insanların aslında tamamiyle birbirleri ile çelişmiş olduğunu ne sıklıkla hissediyorsunuz? Eğer siz de, tıpkı bizim gibi, toplantılarda sıkılmış ya da hayal kırıklığına uğramışsanız, birlikte çalışarak belki de yepyeni bir yaklaşım geliştirebiliriz.</p>
                    </div>
                </div>
                <div class="one-half last">
                    <i class="icon-pencil special"></i>
                    <div class="info">
                        <h3>Profesyonel Yazma Becerileri</h3>
                        <p>İngilizce (ve Türkçe) yazma becerilerinizi geliştirmeye ihtiyacınız mı var? Peki, işinizi daha başarılı bir seviyeye taşımak ya da yeniliklere adım atmak ister misiniz? Amacınız ister kariyerinizi ilerletmek, isterse işyerinizin değişen gerekliliklerine uyum sağlamak olsun, NLP tekniklerinin kullanıldığı bu kurs ile sizlere yazım tekniğinizi yepyeni bir noktaya taşıyacak becerileri öğretmeyi amaçlıyoruz.</p>
                    </div>
                </div>
                <div class="clear"></div>
                <br />
                <div class="one-half">
                    <i class="icon-megaphone-1 special"></i>
                    <div class="info">
                        <h3>Sunum Becerileri</h3>
                        <p>Ne sıklıkla bir sunuma ya da seminere katılıyor ve biran önce bitmesini diliyorsunuz? Birçok profesyonel hatırı sayılır bir bilgi birikimi ve deneyime sahipken, bizim de onlardan öğrenecek çok şeyimiz var. Ne var ki birçoğu konularını etkin bir şekilde sunmakta güçlük çekiyor.</p>
                    </div>
                </div>
                <div class="one-half last">
                    <i class="icon-graduation-cap special"></i>
                    <div class="info">
                        <h3>İngilizce Konuşma Dilinin Hızlı Edinimi</h3>
                        <p>Öğrencilerin konuşma kapasitesini artıracak çığır açıcı yepyeni bir yöntem. Pace ED, ana dili İngilizce olmayan kişilerin İngilizce konuşma becerilerinin geliştirilmesinde 5 kilit nokta saptamıştır. </p>
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
