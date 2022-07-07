using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteShopCaCanh.Context;
using static WebsiteShopCaCanh.Common;



namespace WebsiteShopCaCanh.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        WebsiteShopCaCanhEntities1 objWebsiteShopCaCanhEntities = new WebsiteShopCaCanhEntities1();
        
        // GET: Admin/Product
        public ActionResult Index(string currentFilter,string SearchString,int? page)
        {
            var lstProduct = new List<Product>();
            if(SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                //Lay san pham theo tu khoa tim kiem
                lstProduct = objWebsiteShopCaCanhEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();
            }
            else
            {
                //Lay tat ca san pham trong bang Product
                lstProduct = objWebsiteShopCaCanhEntities.Products.ToList();
            }
            ViewBag.currentFilter = SearchString;
            //So luong item cua 1 den 4 trang
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            //sap xep theo id san pham
            lstProduct = lstProduct.OrderByDescending(n => n.Id).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Details(int Id)
        {
            var objProduct = objWebsiteShopCaCanhEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Create()
        {
            this.LoadData();
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (objProduct.ImageUpload != null)
                    {
                        string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                        string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                        fileName = fileName + extension;
                        objProduct.Avartar = fileName;
                        objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                    }
                    objProduct.CreatedOnUtc = DateTime.Now;
                    objWebsiteShopCaCanhEntities.Products.Add(objProduct);
                    objWebsiteShopCaCanhEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
               
            }
            catch
            {
                return RedirectToAction("Create");
            }
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objProduct = objWebsiteShopCaCanhEntities.Products.Where(n => n.Id == id).FirstOrDefault();

            return View(objProduct);
        }

        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebsiteShopCaCanhEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();
            objWebsiteShopCaCanhEntities.Products.Remove(objProduct);
            objWebsiteShopCaCanhEntities.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            this.LoadData();
            var objProduct = objWebsiteShopCaCanhEntities.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }


        [HttpPost]
        public ActionResult Edit(Product objProduct)
        {
            if(ModelState.IsValid)
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension;
                    objProduct.Avartar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }
                objProduct.CreatedOnUtc = DateTime.Now;
                objWebsiteShopCaCanhEntities.Entry(objProduct).State = EntityState.Modified;
                objWebsiteShopCaCanhEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            
            return View(objProduct);

        }

        void LoadData()
        {
            Common objCommon = new Common();

            //Category
            //Lấy dữ liệu từ DB
            var lstCat = objWebsiteShopCaCanhEntities.Categories.ToList();
            //Convert sang select list dang value, text
            ListtoDataTableConverter Converter = new ListtoDataTableConverter();
            DataTable dtCategogy = Converter.ToDataTable(lstCat);
            ViewBag.ListCategory = objCommon.ToSelectList(dtCategogy, "Id", "Name");

            //Brand
            //Lay du lieu tu DB
            var lstBrand = objWebsiteShopCaCanhEntities.Brands.ToList();
            DataTable dtBrand = Converter.ToDataTable(lstBrand);
            ViewBag.ListBrand = objCommon.ToSelectList(dtBrand, "Id", "Name");
            //Loai san pham
            List<ProductType> lstProductType = new List<ProductType>();
            //Giam gia
            ProductType objProductType = new ProductType();
            objProductType.Id = 01;
            objProductType.Name = "Giảm giá";
            lstProductType.Add(objProductType);
            //DE xuat
            objProductType = new ProductType();
            objProductType.Id = 02;
            objProductType.Name = "Đề xuất";
            lstProductType.Add(objProductType);

            DataTable dtProduct = Converter.ToDataTable(lstProductType);
            ViewBag.ProductType = objCommon.ToSelectList(dtProduct, "Id", "Name");
        } 
    }
}