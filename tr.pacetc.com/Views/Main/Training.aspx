<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Main/Pace.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleCPH" runat="server">
    Pace | Eğitim
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadCPH" runat="server">
    <link href="/Client/css/training.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyCPH" runat="server">
    <div class="light-wrapper" id="division">
        <div class="inner">
            <h1>Eğitim Bölümü</h1>
            <br />
            <div class="one-half" id="train" style="width:55%">
                <p>•	Bilindiği üzere İngilizce dünya üzerinde 350 milyondan fazla kişinin ana dilidir. Ancak ikinci dil olarak İngilizceyi kullananlar da dâhil olmak üzere, İngilizce konuşan toplam nüfusun 1 milyar üzerinde olduğu tahmin ediliyor. Bu durum, anadili İngilizce olan ülkelerin yanı sıra, İngilizceyi en yaygın kullanılan dil yaparken, diğer taraftan İngilizce dünyanın önde gelen birçok kuruluşunun resmi dili yapmaktadır. Kısacası, İngilizce konuşma ve İngilizce kullanarak iş yapma becerisi kazanmak bu hızlı küreselleşme çağında ufkunuzu dünya çapında genişletecektir.</p>
                <p>Pace Eğitim Danışmanlık,  dil eğitiminin kilit alanlarında uzmanlaşmıştır.</p>
            </div>
            <div class="one-half last" style="width: auto;background-color:rgba(4, 53, 114, 1);padding:25px;border-radius:25px;color:white;">
                Hızlandırılmış Kurslar (1-2 günlük):
                <ul class="unordered">
                    <li>Toplantı Teknikleri</li>
                    <li>Profesyonel Yazma Becerileri</li>
                    <li>Sunum Becerileri (üniversite öğrencileri için önerilir)</li>
                </ul>
                 Hızlandırılmış kurslar (1 ay / 8 seans):
                <ul class="unordered">
                    <li>İngilizce Konuşma Dilinin Hızlı Edinimi</li>
                </ul>
                Uzun süreli kurslar (6 -12 hafta):
                <ul class="unordered">
                    <li>Genel İngilizce ve İş İngilizcesi (Tüm seviyelerde)</li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="light-wrapper" id="tabs">
        <div class="inner">
            <div class="tabs tab-container process">
                <ul class="etabs">
                    <li class="tab"><a href="#tab-1"><i class="icon-users"></i>Toplantı Teknikleri</a></li>
                    <li class="tab"><a href="#tab-2"><i class="icon-pencil"></i>Profesyonel Yazma Becerileri</a></li>
                    <li class="tab"><a href="#tab-3"><i class="icon-megaphone-1"></i>Sunum Becerileri</a></li>
                    <li class="tab"><a href="#tab-4"><i class="icon-graduation-cap"></i>İngilizce Konuşma Dilinin Hızlı Edinimi</a></li>
                </ul>
                <div class="panel-container">
                    <div class="tab-block" id="tab-1">
                        <div class="one-third">
                            <img src="/Client/images/meeting-techniques.jpg" alt="" />
                            <br />
                            <h4><i class="icon-users"></i>Toplantı Teknikleri</h4>
                            <p>Bu kursta gerekli dil bilgisi, kelime ve ifadelerin yanı sıra, daha önemlisi bunları harmanlayarak kullanma becerisi öğretilmektedir.</p>
                            <p><strong>Gerekli Nitelikler:</strong>Genel İngilizce bilgisi (Orta seviye veya üstü)</p>
                            <p><strong>Katılımcı sayısı:</strong>Maksimum 12.</p>
                        </div>
                        <div class="two-third last">
                            <ul class="unordered">
                                <li>Zihni uyandırma: Katılımcıların kavrama ve öğrenme kapasitesini azami seviyeye çıkarmak için gerekli bir dizi alıştırmalar ve anlatılar.</li>
                                <li>Dinleme becerileri: Dikkatli dinlemeye dair egzersizler.</li>
                                <li>Duyusal keskinlik: Çalışma arkadaşlarınızın dünyalarını nasıl resmettiğine dair ipuçları elde etmek için dinlemeyi öğrenin. Sözlü olmayan ipuçları nasıl yakalanır.</li>
                                <li>Uyum: Hızlı bir şekilde uyum sağlamak, insanları ikna etme ya da onların davranışlarını etkileme açısından hayati önem taşır.</li>
                                <li>Ayak uydurma ve yönlendirme:  Davranışları etkilemek için uyum nasıl kullanılır.</li>
                                <li>Çapalar: Çapalara ilişkin temel eğitim. Çapaları tanıma, yaratma ve sürdürme yöntemleri.</li>
                                <li>Toplantının etkin yönetimi için PEGASUS modelini kullanın.</li>
                                <li>Etkili görüşmeler için MYOUR ve PEGASUS akronimleri kullanın.</li>
                                <li>Daha temiz ve etkili iletişim için META modeliyle tanışın.</li>
                                <li>İkna stratejileri.</li>
                                <li>Tipik bir toplantıdaki karakterler kimlerdir? Ivan the Aggressor (Agresif Ivan), Fran the Facilitator ( Uyumlu Fran) ve arkadaşlarıyla tanışalım.</li>
                                <li>Kalıp kurmak: Yapıcı olmayan bir davranışa kibarca son vermenin yolu.</li>
                                <li>Toplantı simülasyonu.</li>
                                <li>Ruh halini değiştirmek. Ruh halinizi kontrol etmeyi öğrenerek, toplantı zamanı geldiğinde her zaman hazır olun.</li>
                                <li>Kültürel meseleler.</li>
                                <li>Bazı altın kurallar.</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="tab-block" id="tab-2">
                        <div class="one-third">
                            <img src="/Client/images/writing-skills.jpg" alt="" />
                            <br />
                            <h4><i class="icon-pencil"></i>Profesyonel Yazma Becerileri</h4>
                            <p>Bu kursta gerekli dil bilgisi, kelime ve ifadeler öğretilirken, daha da önemlisi bunları harmanlayarak kullanma becerisi kazandırılmaktadır.</p>
                            <p><strong>Gerekli Nitelikler:</strong>Genel İngilizce bilgisi (Orta seviye veya üstü)</p>
                            <p><strong>Katılımcı sayısı:</strong>Maksimum 12.</p>
                        </div>
                        <div class="two-third last">
                            <p><strong>Kurs Yapısı:</strong>Kurs, 1,5 saatlik 4 seanstan oluşmaktadır. Her bir seans, konu ve kapsamlı bilgiyi örneklerle açıklayan metafor kullanımını ve bunlara ilişkin egzersizleri içerecektir. Her bir gün; kursta öğrenilenleri pekiştirecek bir tümevarım yöntemi ile sona erken katılımcıların kurstan maksimum seviyede faydalanmaları ve öğrendiklerini kullanma becerisi edinmeleri sağlanacaktır.</p>
                            <ul class="unordered">
                                <li>Zihni uyandırma: Katılımcıların kavrama ve öğrenme kapasitesini azami seviyeye çıkarmak için gerekli bir dizi alıştırmalar ve anlatılar. Düzgün iletişim kurmanızı engelleyen eski fikirlerin çürütülmesi.</li>
                                <li>İyi oluşturulmuş çıktılar: Mümkün olan bütün açılardan değerlendirerek hedeflerinizi açık ve net bir şekilde ortaya koymayı öğrenin. Okuyucunun ne istediğini iyice anlayın.</li>
                                <li>Yapılandırma: Yazınızı yapılandırmayı öğrenin, böylelikle hazırladığınız yazı mantıksal bir çerçevede sunularak, bir bölümden diğerine etkin bir şekilde geçmesi sağlanır. Yazma becerilerinizi kuvvetlendirmek için çapaları kullanın.</li>
                                <li>Açık ve net dil kullanımı: Kullandığınız dilde son derece açık ve net olmayı öğrenin. İletişiminizin sorumluluğunu üstlenin.</li>
                                <li>Genelden özele: Bilgileriniz nasıl sunuldu? Çok genel ifadelerle mi yoksa çok özel ifadelerle mi? Yazma becerinizin bu yönünü tamamıyla kontrol altına alarak onu en etkin şekilde iletişim kurmak için kullanın.</li>
                                <li>Hatasız yazım teknikleri: Yazım denetimcisi kullanabilirsiniz, ancak kendi yazınızı kontrol etme becerisi, size yazmış olduklarınızın cümle ve paragraflar açısından yapısını değerlendirme becerisini de katmaktadır.</li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="tab-block" id="tab-3">
                        <div class="one-third">
                            <img src="/Client/images/presentation-skills.jpg" alt="" />
                            <br />
                            <h4><i class="icon-megaphone-1"></i>Sunum Becerileri</h4>                            
                            <p><strong>Gerekli Nitelikler:</strong>Genel İngilizce bilgisi (Orta seviye veya üstü)</p>
                            <p><strong>Katılımcı sayısı:</strong>Sınırsız</p>
                        </div>
                        <div class="two-third last">
                            <p>Sunum becerilerini geliştir ve dinleyicilerini etkile!</p>
                            <p>Bu tek günlük kursta, sizlere topluluk önünde yapılan konuşmalardaki en kötü alışkanlıkları göstereceğiz. Sonrasında ise daha pratik ve dinamik yöntemleri sizlerle paylaşacağız.</p>
                            <ul class="unordered">
                                <li>Dinleyicilerinizi konuya nasıl ısındırırsınız?</li>
                                <li>Onların ilgisini nasıl çekersiniz?</li>
                                <li>Dinleyicilerinizin dikkatini sunumunuzdaki belirli ana noktalara nasıl çekersiniz?</li>
                                <li>Slayt gösteriniz nasıl görünmeli?</li>                                
                            </ul>
                            <p>İşinize yarayacak tüyolar!</p>
                            <p>Böyle önemli sunum günlerinde güveninizi nasıl daha da artıracağınızı sizlere öğreteceğiz.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="tab-block" id="tab-4">
                        <div class="one-third">
                            <img src="/Client/images/fase.jpg" alt="" />
                            <br />
                            <h4><i class="icon-graduation-cap"></i>İngilizce Konuşma Dilinin Hızlı Edinimi</h4>                            
                            <p>Öğrencilerin konuşma kapasitesini artıracak çığır açıcı yepyeni bir yöntem. Pace ED, ana dili İngilizce olmayan kişilerin İngilizce konuşma becerilerinin geliştirilmesinde 5 kilit nokta saptamıştır.</p>
                        </div>
                        <div class="two-third last">                            
                            <ul class="unordered">
                                <li>Dil yapısı: İngilizce bir cümledeki yüklemin yeri, cümleyi hızlı bir şekilde kurmanın anahtarıdır. En yaygın kelimeleri öğrenerek konuşma potansiyelinizi artırın.</li>
                                <li>Yaygın olarak kullanılan sözcükler: Ortalama 200 kelime, günlük İngilizce konuşma dilinin %50 -80’ini oluşturmaktadır. Bu kelimeleri hızlıca öğrenebilmeniz için çeşitli alıştırmalarımız var.</li>
                                <li>Ölçekleme: Türkçe dil olarak cümle başına, hatta kelime başına oldukça fazla detayı içerme eğilimdedir. Birçok insan aynı düzeyde detayı İngilizcede de kullanmaya çalışırken, bunu gerçekleştirebilmek için yeterli dil ve kelime bilgisine henüz sahip değiller. Kendinizi daha kolay ifade etmek için daha genel ifadeleri düşünme konusunda zihninizi eğitin.</li>
                                <li>Çapalar: Birçok kişi, özellikle yaşıtlarıyla, başka bir dilde konuşma konusunda oldukça tedirgindir. Bu korkunun üstesinden gelmeyi öğrenerek daha özgür ve kolay konuşun.</li>                                
                                <li>Ritim: Başka bir dilde kulağa daha doğal gelmenin püf noktası. Pace ED, Beşli Ölçü olarak adlandırılan ve William Shakespeare ile tanınmış bir yapıdan faydalanarak konuşmanıza doğal bir İngilizce ritmi katar. </li>
                            </ul>                            
                        </div>
                        <div class="clear"></div>
                    </div>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeastScriptsCPH" runat="server">
</asp:Content>
