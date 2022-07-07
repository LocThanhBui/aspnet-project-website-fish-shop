using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteShopCaCanh.Context;

namespace WebsiteShopCaCanh.Controllers
{
    public class ProductGridController : Controller
    {
        WebsiteShopCaCanhEntities1 objWebsiteShopCaCanhEntities = new WebsiteShopCaCanhEntities1();
        // GET: ProductGrid
        public ActionResult ProductGrid(int Id)
        {
            var lstProduct = objWebsiteShopCaCanhEntities.Products.Where(n=> n.CategoryId == Id).ToList();
            return View(lstProduct);
        }
    }
}