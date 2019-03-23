using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using emeroglu.Database.Implementations;

namespace cms.pacetc.com.Controllers
{
    public class HomeController : Controller
    {

        private bool Check(string token)
        {
            if (token != null)
            {
                ViewBag.Token = token;

                DBI dbi = new DBI();

                if ((bool)dbi.SelectSingleCell("SELECT Active FROM paceLogins WHERE Token='" + token + "'"))
                {
                    return true;
                }
            }

            return false;
        }

        [HttpGet]
        public ActionResult Index()
        {
            if (Request.QueryString["token"] != null)
            {
                DBI dbi = new DBI();

                dbi.Execute("UPDATE paceLogins SET Active=0 WHERE Token='" + Request.QueryString["token"] + "'");
            }

            return View();
        }

        [HttpGet]
        public string Login(string username, string password)
        {
            if (username == "pacetc" && password == "pacetc")
            {
                string g = new Random().Next(0, 999999999).ToString();

                DBI dbi = new DBI();

                dbi.Execute("INSERT INTO paceLogins VALUES ('" + DateTime.Now.Date.ToString().Substring(0, 10) + "','" + DateTime.Now.TimeOfDay.ToString().Substring(0, 8) + "','" + g + "',1)");

                return g;
            }
            else
                return "f";
        }

        public ActionResult Stats()
        {
            ViewBag.Page = "Statistics";

            string token = Request.QueryString["token"];

            if (Check(token))
                return View();

            return View("Index");
        }

        public ActionResult BannerEN()
        {
            ViewBag.Page = "Banner (EN)";

            string token = Request.QueryString["token"];

            if (Check(token))
                return View();

            return View();
        }

        public ActionResult BannerTR()
        {
            ViewBag.Page = "Banner (TR)";

            string token = Request.QueryString["token"];

            if (Check(token))
                return View();

            return View();
        }

        [HttpGet]
        public JsonResult AllBannersEN()
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
                banner.OnAir = (bool)columns.GetValue(16);

                listBanners.Add(banner);
            }

            return this.Json(listBanners, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult AllBannersTR()
        {
            DBI dbi = new DBI();

            DataTable dtBanners = dbi.Select(new Procedure("pacetrAllBanners"));

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
                banner.OnAir = (bool)columns.GetValue(16);

                listBanners.Add(banner);
            }

            return this.Json(listBanners, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveBannerEN(Banner banner)
        {
            foreach (var prop in banner.GetType().GetProperties())
            {
                if (banner.GetType().GetProperty(prop.Name).GetValue(banner, null) == null)
                    banner.GetType().GetProperty(prop.Name).SetValue(banner, "", null);
            }

            DBI dbi = new DBI();

            string[] parameters = {
                                    "@ID",
                                    "@Slot",
                                    "@Duration",
                                    "@Title",
                                    "@TopImage",
                                    "@TopImageUrl",
                                    "@TopImageWidth",
                                    "@FirstCaption",
                                    "@FirstCaptionSize",
                                    "@SecondCaption",
                                    "@SecondCaptionSize",
                                    "@BannerImage",
                                    "@BannerImageUrl",
                                    "@BannerImageWidth",
                                    "@ButtonText",
                                    "@ButtonUrl",
                                    "@OnAir"
                                  };

            object[] values = {
                                  banner.ID,
                                  banner.Slot,
                                  banner.Duration,
                                  banner.Title,
                                  banner.TopImage,
                                  banner.TopImageUrl,
                                  banner.TopImageWidth,
                                  banner.FirstCaption,
                                  banner.FirstCaptionSize,
                                  banner.SecondCaption,
                                  banner.SecondCaptionSize,
                                  banner.BannerImage,
                                  banner.BannerImageUrl,
                                  banner.BannerImageWidth,
                                  banner.ButtonText,
                                  banner.ButtonUrl,
                                  banner.OnAir
                              };

            try
            {
                dbi.ExecuteWithParameters(new Procedure("paceSaveBanner", parameters, values));
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (System.Exception ex)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }

        }

        public JsonResult SaveBannerTR(Banner banner)
        {
            foreach (var prop in banner.GetType().GetProperties())
            {
                if (banner.GetType().GetProperty(prop.Name).GetValue(banner, null) == null)
                    banner.GetType().GetProperty(prop.Name).SetValue(banner, "", null);
            }

            DBI dbi = new DBI();

            string[] parameters = {
                                    "@ID",
                                    "@Slot",
                                    "@Duration",
                                    "@Title",
                                    "@TopImage",
                                    "@TopImageUrl",
                                    "@TopImageWidth",
                                    "@FirstCaption",
                                    "@FirstCaptionSize",
                                    "@SecondCaption",
                                    "@SecondCaptionSize",
                                    "@BannerImage",
                                    "@BannerImageUrl",
                                    "@BannerImageWidth",
                                    "@ButtonText",
                                    "@ButtonUrl",
                                    "@OnAir"
                                  };

            object[] values = {
                                  banner.ID,
                                  banner.Slot,
                                  banner.Duration,
                                  banner.Title,
                                  banner.TopImage,
                                  banner.TopImageUrl,
                                  banner.TopImageWidth,
                                  banner.FirstCaption,
                                  banner.FirstCaptionSize,
                                  banner.SecondCaption,
                                  banner.SecondCaptionSize,
                                  banner.BannerImage,
                                  banner.BannerImageUrl,
                                  banner.BannerImageWidth,
                                  banner.ButtonText,
                                  banner.ButtonUrl,
                                  banner.OnAir
                              };

            try
            {
                dbi.ExecuteWithParameters(new Procedure("pacetrSaveBanner", parameters, values));
                return Json("S", JsonRequestBehavior.AllowGet);
            }
            catch (System.Exception ex)
            {
                return Json("F", JsonRequestBehavior.AllowGet);
            }

        }

        [HttpGet]
        public JsonResult AllStats()
        {

            DBI dbi = new DBI();

            DataTable dtStats = dbi.Select("SELECT Date,Time,Page,Country,Region,City,Mobile,MobileOS,MobileModel,Browser FROM paceLogs ORDER BY ID DESC");

            Stat stat;
            List<Stat> listStats = new List<Stat>();

            object[] columns;
            foreach (DataRow row in dtStats.Rows)
            {
                columns = row.ItemArray;

                stat = new Stat();
                stat.Date = (string)columns.GetValue(0);
                stat.Time = (string)columns.GetValue(1);
                stat.Page = (string)columns.GetValue(2);
                stat.Country = (string)columns.GetValue(3);
                stat.Region = (string)columns.GetValue(4);
                stat.City = (string)columns.GetValue(5);
                stat.Mobile = (bool)columns.GetValue(6);
                stat.MobileOS = (string)columns.GetValue(7);
                stat.MobileModel = (string)columns.GetValue(8);
                stat.Browser = (string)columns.GetValue(9);
                listStats.Add(stat);
            }

            return this.Json(listStats, JsonRequestBehavior.AllowGet);
        }

        public ActionResult FeedbacksEN()
        {
            ViewBag.Page = "Feedbacks (EN)";

            string token = Request.QueryString["token"];

            if (Check(token))
                return View();

            return View();
        }

        public ActionResult FeedbacksTR()
        {
            ViewBag.Page = "Feedbacks (TR)";

            string token = Request.QueryString["token"];

            if (Check(token))
                return View();

            return View();
        }

        [HttpGet]
        public JsonResult AllFeedsEN()
        {
            DBI dbi = new DBI();

            DataTable dtFeedbacks = dbi.Select(new Procedure("paceAllFeedbacks"));

            Feedback feed;
            List<Feedback> listFeeds = new List<Feedback>();

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
                feed.OnAir = (bool)columns.GetValue(6);
                listFeeds.Add(feed);
            }

            return Json(listFeeds, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult AllFeedsTR()
        {
            DBI dbi = new DBI();

            DataTable dtFeedbacks = dbi.Select(new Procedure("pacetrAllFeedbacks"));

            Feedback feed;
            List<Feedback> listFeeds = new List<Feedback>();

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
                feed.OnAir = (bool)columns.GetValue(6);
                listFeeds.Add(feed);
            }

            return Json(listFeeds, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveFeedbackEN(Feedback feedback)
        {

            foreach (var prop in feedback.GetType().GetProperties())
            {
                if (feedback.GetType().GetProperty(prop.Name).GetValue(feedback, null) == null)
                    feedback.GetType().GetProperty(prop.Name).SetValue(feedback, "", null);
            }

            DBI dbi = new DBI();

            string[] parameters = {
                                      "@ID",
                                      "@Image",
                                      "@ImageUrl",
                                      "@Text",
                                      "@Author",
                                      "@Company",
                                      "@OnAir"
                                  };

            object[] values = {
                                  feedback.ID,
                                  feedback.Image,
                                  feedback.ImageUrl,
                                  feedback.Text,
                                  feedback.Author,
                                  feedback.Company,
                                  feedback.OnAir
                              };

            try
            {
                dbi.ExecuteWithParameters(new Procedure("paceSaveFeedback", parameters, values));
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (System.Exception ex)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }


        }

        public JsonResult SaveFeedbackTR(Feedback feedback)
        {

            foreach (var prop in feedback.GetType().GetProperties())
            {
                if (feedback.GetType().GetProperty(prop.Name).GetValue(feedback, null) == null)
                    feedback.GetType().GetProperty(prop.Name).SetValue(feedback, "", null);
            }

            DBI dbi = new DBI();

            string[] parameters = {
                                      "@ID",
                                      "@Image",
                                      "@ImageUrl",
                                      "@Text",
                                      "@Author",
                                      "@Company",
                                      "@OnAir"
                                  };

            object[] values = {
                                  feedback.ID,
                                  feedback.Image,
                                  feedback.ImageUrl,
                                  feedback.Text,
                                  feedback.Author,
                                  feedback.Company,
                                  feedback.OnAir
                              };

            try
            {
                dbi.ExecuteWithParameters(new Procedure("pacetrSaveFeedback", parameters, values));
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (System.Exception ex)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }


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
        public bool OnAir { get; set; }
    }

    public class Stat
    {
        public string Date { get; set; }
        public string Time { get; set; }
        public string Page { get; set; }
        public string Country { get; set; }
        public string Region { get; set; }
        public string City { get; set; }
        public bool Mobile { get; set; }
        public string MobileOS { get; set; }
        public string MobileModel { get; set; }
        public string Browser { get; set; }
    }

    public class Feedback
    {
        public int ID { get; set; }
        public bool Image { get; set; }
        public string ImageUrl { get; set; }
        public string Text { get; set; }
        public string Author { get; set; }
        public string Company { get; set; }
        public bool OnAir { get; set; }
    }


}
