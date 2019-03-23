<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace | Tercüme
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <style type="text/css">
        .unordered li i:before
        {
            margin-right:10px;
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
                <h1>Çeviri ve Redaksiyon Bölümü</h1><br />
                <p>Çeviri Bölümümüz önde gelen birçok yerel ve uluslararası kuruluşlarla çalışmaktadır. Her biri kendi alanında uzman Türk çevirmen kadromuzla, Türkçe’den İngilizce’ye birçok alanda çeviri konusunda uzmanlaşmış bulunuyoruz.</p>
                Bu alanlar arasında:
                <ul class="unordered">
                    <li><i class="icon-export"></i>Yıllık ihracat analizleri</li>
                    <li><i class="icon-folder"></i>Faaliyet raporları</li>
                    <li><i class="icon-flight-1"></i>Aylık (uçak) seyahat dergileri</li>
                    <li><i class="icon-picture"></i>Moda dergileri ve yayınları</li>
                    <li><i class="icon-thumbs-up"></i>Lokalizasyon firmaları için çeviriler</li>
                    <li><i class="icon-briefcase"></i>Hukuki evraklar</li>
                    <li><i class="icon-money"></i>Finansal raporlar</li>
                    <li><i class="icon-mobile"></i>Teknolojik dokümanlar</li>
                    <li><i class="icon-book-1"></i>Çeşitli konularda kitaplar</li>                   
                    <li><i class="icon-monitor"></i>İnternet siteleri</li>
                    <li>ve daha fazlası...</li>                    
                </ul>                
            </div>
            <div class="one-half last">                
                 <img src="/Client/images/photo.JPG" />
            </div>
            <div class="clear"></div>
            <div class="one-full"> 
                <p>Ana dili İngilizce olan ve redaksiyon konusunda engin bir deneyime sahip editörümüz tarafından her bir çeviri itinayla düzenlenir.  Amacımız,  teslim ettiğimiz belgenin üslubu ve ustalığı açısından sanki orijinal dilinde, yani İngilizce,  hazırlanmış bir doküman olarak okunmasını sağlamaktır.</p>
                <p>Mümkün mertebe en iyi sonucu alabilmek adına müşteri ile sıkı bir işbirliği içerisinde olma prensibini benimsemekteyiz. Bu işbirliği, bir ifade veya bir kelimenin nasıl geliştirilebileceği ya da en iyi sonucu ortaya koymak için yapılabilecek olası değişikliklere ilişkin önerileri veya tavsiyeleri içermektedir. Çevirileri nihai okurun ana dil düzeyinde ya da ileri seviye İngilizce bildiği varsayımı ile yapmaktayız.</p>
            </div>            
            <div class="clear"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">

</asp:Content>
