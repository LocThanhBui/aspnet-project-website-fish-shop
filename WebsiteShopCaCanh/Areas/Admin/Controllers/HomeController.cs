using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteShopCaCanh.Context;


namespace WebsiteShopCaCanh.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        WebsiteShopCaCanhEntities1 objWebsiteShopCaCanhEntities = new WebsiteShopCaCanhEntities1();

        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}