using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_CCS.Controllers
{
    public class HomeController : Controller
    {
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
            return View();
        }
        public ActionResult HistoryCart()
        {
            return View();
        }
        public ActionResult DetailProduct()
        {
            return View();
        }
        public ActionResult UserDashBoard()
        {
            return View();
        }
        public ActionResult adminDashboard()
        {
            return View();
        }
    }
}