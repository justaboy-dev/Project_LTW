using Project_CCS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_CCS.Controllers
{
    public class HomeController : Controller
    {
        ContextDB context = new ContextDB();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShoppingCart()
        {
            return View();
        }
        public ActionResult ListProduct()
        {
            List<Product> list = context.Product.ToList();
            return View(list);
        }
        public ActionResult HistoryCart()
        {
            return View();
        }
        public ActionResult DetailProduct(int id)
        {
            Product pd = context.Product.FirstOrDefault( p => p.id == id);
            return View(pd);
        }
        public ActionResult UserDashBoard()
        {
            return View();
        }
        public ActionResult adminDashboard()
        {
            return View();
        }

        public ActionResult productManager()
        {
            List<Product> list = context.Product.ToList();
            return View(list);
        }
        public ActionResult deleteProduct(int id)
        {
            Product pd = context.Product.FirstOrDefault(p => p.id == id);

            context.Product.Remove(pd);
            context.SaveChanges();

            List<Product> list = context.Product.ToList();
            return View("productManager",list);
        }
        public ActionResult editProduct(int id)
        {
            Product pd = context.Product.FirstOrDefault(p => p.id == id);
            return View(pd);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {
      
                    Product pd = context.Product.FirstOrDefault(p => p.id == product.id);

                    pd.name = product.name;
                    pd.price = product.price;
                    pd.descriptions = product.descriptions;
                   pd.image = product.image;

                    context.SaveChanges();
                    return View("productManager",context.Product.ToList());
          
        }
    }
}