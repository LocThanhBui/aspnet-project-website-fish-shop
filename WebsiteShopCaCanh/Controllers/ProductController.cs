using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteShopCaCanh.Models;
using WebsiteShopCaCanh.Context;

namespace WebsiteShopCaCanh.Controllers
{
    public class ProductController : Controller
    {
        WebsiteShopCaCanhEntities1 objWebsiteShopCaCanhEntities = new WebsiteShopCaCanhEntities1();
        // GET: Product
        public ActionResult Detail(int Id)
        {
            var objProduct = objWebsiteShopCaCanhEntities.Products.Where(n=> n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}