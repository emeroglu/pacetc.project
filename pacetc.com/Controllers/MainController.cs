using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Serialization;
using emeroglu.Database.Implementations;

namespace pacetc.com.Controllers
{
    public class MainController : Controller
    {

        public ActionResult Home()
        {
            DBI dbi = new DBI();

            DataTable dtFeedbacks = dbi.Select(new Procedure("paceFeedbacksOnAir"));
            DataTable dtBanners = dbi.Select(new Procedure("paceBannersOnAir"));

            Feedback feed;
            List<Feedback> listFeeds = new List<Feedback>();

            Banner banner;
            List<Banner> listBanners = new List<Banner>();

            object[] columns;
            foreach (DataRow row in dtFeedbacks.Rows)
            {
                columns = row.ItemArray;

                feed = new Feedback();
                feed.ID = (int)columns.GetValue(0);
                feed.Image = (bool)columns.GetValue(1);
                feed.ImageUrl = (string)columns.GetValue(2);
                feed.Text = (string)columns.GetValue(3);
                feed.Author = (string)columns.GetValue(4);
                feed.Company = (string)columns.GetValue(5);
                listFeeds.Add(feed);
            }

            foreach (DataRow row in dtBanners.Rows)
            {
                columns = row.ItemArray;

                banner = new Banner();
                banner.ID = (int)columns.GetValue(0);
                banner.Slot = (int)columns.GetValue(1);
                banner.Duration = (string)columns.GetValue(2);
                banner.Title = (string)columns.GetValue(3);
                banner.TopImage = (bool)columns.GetValue(4);
                banner.TopImageUrl = (string)columns.GetValue(5);
                banner.TopImageWidth = (int)columns.GetValue(6);
                banner.FirstCaption = (string)columns.GetValue(7);
                banner.FirstCaptionSize = (int)columns.GetValue(8);
                banner.SecondCaption = (string)columns.GetValue(9);
                banner.SecondCaptionSize = (int)columns.GetValue(10);
                banner.BannerImage = (bool)columns.GetValue(11);
                banner.BannerImageUrl = (string)columns.GetValue(12);
                banner.BannerImageWidth = (int)columns.GetValue(13);
                banner.ButtonText = (string)columns.GetValue(14);
                banner.ButtonUrl = (string)columns.GetValue(15);

                listBanners.Add(banner);
            }

            string html = "", tabs = "";
            int i = 0;

            foreach (Feedback f in listFeeds)
            {
                i++;

                if (f.Image)
                    html += "<div id='tst" + i + "'><div class='one-fourth'><img src='" + f.ImageUrl + "' class='margin' /></div><div class='three-fourth last'><p>" + f.Text + "</p><h4>" + f.Author + "<span>" + f.Company + "</span></h4></div><div class='clear'></div></div>";
                else
                    html += "<div id='tst" + i + "'><p>" + f.Text + "</p><h4>" + f.Author + "<span>" + f.Company + "</span></h4></div>";


                tabs += "<li class='tab'><a href='#tst" + i + "'></a></li>";
            }

            ViewBag.Testimonials = html;
            ViewBag.Tabs = tabs;

            html = "<li data-transition='fade' data-delay='0'></li>";

            foreach (Banner b in listBanners)
            {

                html += "<li data-transition='fade' data-delay='" + b.Duration + "'>";
                html += "<div class='caption sfb big' data-x='center' data-y='40' data-speed='300' data-start='500' data-easing='easeOutExpo'>";
                html += "<img src='/Client/images/symbol.png' style='width: 250px !important; opacity: 0.2;' />";
                html += "</div>";

                if (b.BannerImage)
                {
                    if (b.TopImage)
                    {
                        html += "<div class='caption sft big' data-x='0' data-y='40' data-speed='500' data-start='500' data-easing='easeOutExpo'><img src='" + b.TopImageUrl + "' style='width: " + b.TopImageWidth + "px !important;' /></div>";

                        html += "<div class='caption sfl big' data-x='0' data-y='210' data-speed='300' data-start='800' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='0' data-y='270' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                    else
                    {
                        html += "<div class='caption sft huge' data-x='0' data-y='110' data-speed='300' data-start='800' data-easing='easeOutExpo'><strong>" + b.Title + "</strong></div>";

                        html += "<div class='caption sfl big' data-x='0' data-y='200' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='0' data-y='265' data-speed='300' data-start='1400' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }

                    html += "<div class='caption sfr big' data-x='" + (1100 - b.BannerImageWidth) + "' data-y='60' data-speed='300' data-start='800' data-easing='easeOutExpo'><img src='" + b.BannerImageUrl + "' style='width: " + b.BannerImageWidth + "px !important;' /></div>";

                }
                else
                {
                    if (b.TopImage)
                    {
                        html += "<div class='caption sft big' data-x='center' data-y='40' data-speed='500' data-start='500' data-easing='easeOutExpo'><img src='" + b.TopImageUrl + "' style='width: " + b.TopImageWidth + "px !important;' /></div>";

                        html += "<div class='caption sfl big' data-x='center' data-y='210' data-speed='300' data-start='800' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='center' data-y='270' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                    else
                    {
                        html += "<div class='caption sft huge' data-x='center' data-y='110' data-speed='300' data-start='800' data-easing='easeOutExpo'><strong>" + b.Title + "</strong></div>";

                        html += "<div class='caption sfl big' data-x='center' data-y='200' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='center' data-y='265' data-speed='300' data-start='1400' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                }

                html += "<div class='caption sfb' data-x='center' data-y='340' data-speed='300' data-start='1400' data-easing='easeOutExpo'><a href='" + b.ButtonUrl + "' class='button'>" + b.ButtonText + "</a></div>";

            }

            html += "</li>";

            ViewBag.Banner = html;


            Logs log = new Logs();

            log.Request = Request;
            log.Page = "Home";
            log.Save();

            return View();
        }

        public ActionResult About()
        {
            Logs log = new Logs();

            log.Request = Request;
            log.Page = "About";
            log.Save();

            return View();
        }

        public ActionResult Training()
        {
            Logs log = new Logs();

            log.Request = Request;
            log.Page = "Training";
            log.Save();

            return View();
        }

        public ActionResult Translation()
        {
            Logs log = new Logs();

            log.Request = Request;
            log.Page = "Translation";
            log.Save();

            return View();
        }

        public ActionResult StudyAbroad()
        {
            Logs log = new Logs();

            log.Request = Request;
            log.Page = "Study Abroad";
            log.Save();

            return View();
        }

        public ActionResult BannerPreview()
        {
            DBI dbi = new DBI();

            DataTable dtBanners = dbi.Select(new Procedure("paceAllBanners"));

            Banner banner;
            List<Banner> listBanners = new List<Banner>();

            object[] columns;
            foreach (DataRow row in dtBanners.Rows)
            {
                columns = row.ItemArray;

                banner = new Banner();
                banner.ID = (int)columns.GetValue(0);
                banner.Slot = (int)columns.GetValue(1);
                banner.Duration = (string)columns.GetValue(2);
                banner.Title = (string)columns.GetValue(3);
                banner.TopImage = (bool)columns.GetValue(4);
                banner.TopImageUrl = (string)columns.GetValue(5);
                banner.TopImageWidth = (int)columns.GetValue(6);
                banner.FirstCaption = (string)columns.GetValue(7);
                banner.FirstCaptionSize = (int)columns.GetValue(8);
                banner.SecondCaption = (string)columns.GetValue(9);
                banner.SecondCaptionSize = (int)columns.GetValue(10);
                banner.BannerImage = (bool)columns.GetValue(11);
                banner.BannerImageUrl = (string)columns.GetValue(12);
                banner.BannerImageWidth = (int)columns.GetValue(13);
                banner.ButtonText = (string)columns.GetValue(14);
                banner.ButtonUrl = (string)columns.GetValue(15);

                listBanners.Add(banner);
            }

            string html = "<li data-transition='fade' data-delay='0' id='firstbullet'></li>";

            foreach (Banner b in listBanners)
            {

                html += "<li data-transition='fade' data-delay='" + b.Duration + "'>";
                html += "<div class='caption sfb big' data-x='center' data-y='40' data-speed='300' data-start='500' data-easing='easeOutExpo'>";
                html += "<img src='/Client/images/symbol.png' style='width: 250px !important; opacity: 0.2;' />";
                html += "</div>";

                if (b.BannerImage)
                {
                    if (b.TopImage)
                    {
                        html += "<div class='caption sft big' data-x='0' data-y='40' data-speed='500' data-start='500' data-easing='easeOutExpo'><img src='" + b.TopImageUrl + "' style='width: " + b.TopImageWidth + "px !important;' /></div>";

                        html += "<div class='caption sfl big' data-x='0' data-y='210' data-speed='300' data-start='800' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='0' data-y='270' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                    else
                    {
                        html += "<div class='caption sft huge' data-x='0' data-y='110' data-speed='300' data-start='800' data-easing='easeOutExpo'><strong>" + b.Title + "</strong></div>";

                        html += "<div class='caption sfl big' data-x='0' data-y='200' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='0' data-y='265' data-speed='300' data-start='1400' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }

                    html += "<div class='caption sfr big' data-x='" + (1100 - b.BannerImageWidth) + "' data-y='60' data-speed='300' data-start='800' data-easing='easeOutExpo'><img src='" + b.BannerImageUrl + "' style='width: " + b.BannerImageWidth + "px !important;' /></div>";

                }
                else
                {
                    if (b.TopImage)
                    {
                        html += "<div class='caption sft big' data-x='center' data-y='40' data-speed='500' data-start='500' data-easing='easeOutExpo'><img src='" + b.TopImageUrl + "' style='width: " + b.TopImageWidth + "px !important;' /></div>";

                        html += "<div class='caption sfl big' data-x='center' data-y='210' data-speed='300' data-start='800' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='center' data-y='270' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                    else
                    {
                        html += "<div class='caption sft huge' data-x='center' data-y='110' data-speed='300' data-start='800' data-easing='easeOutExpo'><strong>" + b.Title + "</strong></div>";

                        html += "<div class='caption sfl big' data-x='center' data-y='200' data-speed='300' data-start='1100' data-easing='easeOutExpo' style='font-size:" + b.FirstCaptionSize + "'>" + b.FirstCaption + "</div>";

                        html += "<div class='caption sfr big' data-x='center' data-y='265' data-speed='300' data-start='1400' data-easing='easeOutExpo' style='font-size:" + b.SecondCaptionSize + "'>" + b.SecondCaption + "</div>";
                    }
                }

                html += "<div class='caption sfb' data-x='center' data-y='340' data-speed='300' data-start='1400' data-easing='easeOutExpo'><a href='" + b.ButtonUrl + "' class='button'>" + b.ButtonText + "</a></div>";

            }

            html += "</li>";

            ViewBag.Banner = html;


            return View();
        }

        public void Mail()
        {
            string name = Request.Form["name"].ToString();
            string email = Request.Form["email"].ToString();
            string subject = Request.Form["subject"].ToString();
            string message = Request.Form["message"].ToString();

            MailMessage mail = new MailMessage("info@pacetc.com", "info@pacetc.com");

            mail.Bcc.Add("steveof@pacetc.com");

            mail.Bcc.Add("info@pacetc.com");

            mail.Subject = subject;

            mail.Body = "<h2>Subject:</h2>" + subject + "<h2>Name:</h2>" + name + "<h2>Email:</h2>" + email + "<h2>Message:</h2><p>" + message + "</p>";

            mail.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("pacetc.com", 587);

            NetworkCredential cred = new NetworkCredential("info@pacetc.com", "?pacetc?");
            client.Credentials = cred;

            client.Send(mail);
        }

    }

    public class Banner
    {
        public int ID { get; set; }
        public int Slot { get; set; }
        public string Duration { get; set; }
        public string Title { get; set; }
        public bool TopImage { get; set; }
        public string TopImageUrl { get; set; }
        public int TopImageWidth { get; set; }
        public string FirstCaption { get; set; }
        public int FirstCaptionSize { get; set; }
        public string SecondCaption { get; set; }
        public int SecondCaptionSize { get; set; }
        public bool BannerImage { get; set; }
        public string BannerImageUrl { get; set; }
        public int BannerImageWidth { get; set; }
        public string ButtonText { get; set; }
        public string ButtonUrl { get; set; }
    }

    public class Feedback
    {
        public int ID { get; set; }
        public bool Image { get; set; }
        public string ImageUrl { get; set; }
        public string Text { get; set; }
        public string Author { get; set; }
        public string Company { get; set; }
    }

    [XmlRootAttribute(ElementName = "Response", IsNullable = false)]
    public class IPLocator
    {
        public string CountryName { get; set; }
        public string RegionName { get; set; }
        public string City { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
    }

    public class IPDetails
    {

        public IPLocator GetData(string ipAddress)
        {
            IPLocator ipLoc = new IPLocator();
            try
            {
                string path = "http://freegeoip.net/xml/" + ipAddress;
                WebClient client = new WebClient();
                string[] eResult = client.DownloadString(path).ToString().Split(',');
                if (eResult.Length > 0)
                    ipLoc = (IPLocator)Deserialize(eResult[0].ToString());
            }
            catch
            { }
            return ipLoc;
        }

        private Object Deserialize(string pXmlizedString)
        {
            XmlSerializer xs = new XmlSerializer(typeof(IPLocator));
            MemoryStream memoryStream = new MemoryStream(StringToUTF8ByteArray(pXmlizedString));
            XmlTextWriter xmlTextWriter = new XmlTextWriter(memoryStream, Encoding.UTF8);
            return xs.Deserialize(memoryStream);
        }

        private Byte[] StringToUTF8ByteArray(string pXmlString)
        {
            UTF8Encoding encoding = new UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes(pXmlString);
            return byteArray;
        }

    }

    public class Logs
    {
        public IPLocator Locator
        {
            get
            {
                IPDetails d = new IPDetails();
                IPLocator l = d.GetData(IP);
                return l;
            }
        }

        public HttpRequestBase Request { get; set; }

        private string Date
        {
            get
            {
                return DateTime.Now.Date.ToString().Substring(0, 10);
            }
        }
        private string Time
        {
            get
            {
                return DateTime.Now.TimeOfDay.ToString().Substring(0, 8);
            }
        }
        public string Page { get; set; }

        private string IP
        {
            get
            {
                return Request.UserHostName;
            }
        }
        private string Country
        {
            get
            {
                return (Locator.CountryName == null) ? "" : Locator.CountryName;
            }
        }
        private string Region
        {
            get
            {
                return (Locator.RegionName == null) ? "" : Locator.RegionName;
            }
        }
        private string City
        {
            get
            {
                return (Locator.City == null) ? "" : Locator.City;
            }
        }
        private string Latitude
        {
            get
            {
                return (Locator.Latitude == null) ? "" : Locator.Latitude;
            }
        }
        private string Longitude
        {
            get
            {
                return (Locator.Longitude == null) ? "" : Locator.Longitude;
            }
        }

        private string UserAgent
        {
            get
            {
                string ua = Request.UserAgent;

                int x = 0, y = 0;
                while (ua.Substring(x, 1) != "(")
                    x++;

                while (ua.Substring(y, 1) != ")")
                    y++;

                ua = ua.Substring(x + 1, y - x - 1);

                return ua;
            }
        }
        private string Browser
        {
            get
            {
                return Request.Browser.Browser;
            }
        }
        private string Desktop
        {
            get
            {
                return (Mobile == "0") ? "1" : "0";
            }
        }
        private string Mobile
        {
            get
            {
                return (Request.UserAgent.Contains("Mobile") | Request.UserAgent.Contains("WPDesktop")) ? "1" : "0";
            }
        }
        private string MobileOS
        {
            get
            {
                string mobileOS = "";

                if (Browser == "Chrome" & Mobile == "1")
                {
                    if (UserAgent.Contains("Android"))
                    {
                        try
                        {

                            string[] ua = UserAgent.Split(';');

                            for (int i = 0;i <= ua.Length - 1;i++)
                            {
                                if (ua[i].Contains("Android"))
                                    mobileOS = ua[i];
                            }

                            mobileOS = mobileOS.Substring(1, mobileOS.Length - 1);
                        }
                        catch
                        {
                            mobileOS = "Other";
                        }

                    }
                }
                else if (Browser == "Safari" & Mobile == "1")
                {
                    if (UserAgent.Contains("Android"))
                    {
                        try
                        {
                            string[] ua = UserAgent.Split(';');

                            for (int i = 0;i <= ua.Length - 1;i++)
                            {
                                if (ua[i].Contains("Android"))
                                    mobileOS = ua[i];
                            }

                            mobileOS = mobileOS.Substring(1, mobileOS.Length - 1);
                        }
                        catch
                        {
                            mobileOS = "Other";
                        }
                    }
                    else
                    {
                        try
                        {
                            mobileOS = (UserAgent.Split(';').Length == 4) ? UserAgent.Split(';')[2].Substring(1, UserAgent.Split(';')[2].Length - 1) : UserAgent.Split(';')[1].Substring(1, UserAgent.Split(';')[1].Length - 1);
                        }
                        catch
                        {
                            mobileOS = "Other";
                        }
                    }
                }
                else if (UserAgent.Contains("Windows Phone"))
                {
                    try
                    {
                        string[] ua = UserAgent.Split(';');

                        for (int i = 0;i <= ua.Length - 1;i++)
                        {
                            if (ua[i].Contains("Windows Phone"))
                                mobileOS = ua[i].Substring(1, ua[i].Length - 1);
                        }
                    }
                    catch
                    {
                        mobileOS = "Other";
                    }
                }

                return mobileOS;
            }
        }
        private string MobileModel
        {
            get
            {
                string model = "";

                if (Browser == "Chrome" & Mobile == "1")
                {
                    if (UserAgent.Contains("Android"))
                    {
                        try
                        {
                            string[] ua = UserAgent.Split(';');

                            for (int i = 0;i <= ua.Length - 1;i++)
                            {
                                if (ua[i].Contains("Build"))
                                    model = ua[i];
                            }

                            int x = 0;
                            while (model.Substring(x, 5) != "Build")
                                x++;

                            model = model.Substring(1, x - 2);
                        }
                        catch
                        {
                            model = "Other";
                        }
                    }
                }
                else if (Browser == "Safari" & Mobile == "1")
                {
                    if (UserAgent.Contains("Android"))
                    {
                        try
                        {
                            string[] ua = UserAgent.Split(';');

                            for (int i = 0;i <= ua.Length - 1;i++)
                            {
                                if (ua[i].Contains("Build"))
                                    model = ua[i];
                            }

                            int x = 0;
                            while (model.Substring(x, 5) != "Build")
                                x++;

                            model = model.Substring(1, x - 2);
                        }
                        catch
                        {
                            model = "Other";
                        }
                    }
                    else
                    {
                        try
                        {

                            for (int i = 0;i <= UserAgent.Length - 7;i++)
                            {
                                if (Request.UserAgent.Substring(i, 6) == "Mobile")
                                {
                                    model = Request.UserAgent.Substring(i, 13);
                                    break;
                                }
                            }

                            if (model.Contains(" "))
                                model = model.Split(' ')[0];

                            model = model.Split('/')[1];

                            model = (Request.UserAgent.Contains("iPad")) ? "iPad/" + model : model;
                            model = (Request.UserAgent.Contains("iPhone")) ? "iPhone/" + model : model;
                            model = (Request.UserAgent.Contains("iPod")) ? "iPod/" + model : model;
                        }
                        catch
                        {
                            model = "Other";
                        }
                    }
                }
                else if (UserAgent.Contains("Windows Phone"))
                {
                    try
                    {
                        string[] ua = UserAgent.Split(';');

                        model = ua[ua.Length - 2] + " " + ua[ua.Length - 1];
                    }
                    catch
                    {
                        model = "Other";
                    }
                }
                return model;
            }
        }

        public void Save()
        {
            DBI dbi = new DBI();

            string[] parameters = {
                                        "@Page",
	                                    "@IP",
	                                    "@Country",
	                                    "@Region",
	                                    "@City",
	                                    "@Latitude",
	                                    "@Longitude",
	                                    "@UserAgent",
	                                    "@Browser",
	                                    "@Desktop",
	                                    "@Mobile",
	                                    "@MobileOS",
	                                    "@MobileModel",
	                                    "@Date",
	                                    "@Time"
                                  };

            object[] values = {
                                  Page,
                                  IP,
                                  Country,
                                  Region,
                                  City,
                                  Latitude,
                                  Longitude,
                                  UserAgent,
                                  Browser,
                                  Desktop,
                                  Mobile,
                                  MobileOS,
                                  MobileModel,
                                  Date,
                                  Time
                              };

            dbi.ExecuteWithParameters(new Procedure("paceLog", parameters, values));

        }
    }
}
