using ProjectCCS.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectCCS.Controllers
{
    public class HomeController : Controller
    {
        ContextDB context = new ContextDB();

        public bool CheckLogin()
        {
            HttpCookie cookie = Request.Cookies["user"];
            if (cookie == null)
                return false;
            else
                return true;
        }
        public string getUser()
        {
            return Request.Cookies["user"].Value;
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ShoppingCart()
        {
            if (!CheckLogin())
                return View("Login");
            else
                return View();
        }
        public ActionResult ListProduct()
        {
            List<Product> list = context.Products.ToList();
            ViewBag.categories = context.Categories.ToList();
            return View(list);
        }
        public ActionResult HistoryCart()
        {
            return View();
        }
        public ActionResult DetailProduct(int id)
        {
            Product pd = context.Products.FirstOrDefault(p => p.id == id);
            return View(pd);
        }
        public ActionResult UserDashBoard()
        {
            if(!CheckLogin())
            {
                return View("Login");
            }
            else
            {
                var usremail = getUser();
                User usr = context.Users.Where(p => p.Email.Equals(usremail)).FirstOrDefault();
                ViewBag.User = usr;
                return View();
            }
        }
        public ActionResult adminDashboard()
        {
            return View();
        }

        public ActionResult productManager()
        {
            List<Product> list = context.Products.ToList();
            ViewBag.lst = list;
            ViewBag.Categories = context.Categories.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Add(FormCollection form, HttpPostedFileBase file)
        {
            Product p = new Product();
            return RedirectToAction("productManager");
        }
        public ActionResult deleteProduct(int id)
        {
            Product pd = context.Products.FirstOrDefault(p => p.id == id);

            context.Products.Remove(pd);
            context.SaveChanges();

            List<Product> list = context.Products.ToList();
            ViewBag.lst = list;
            ViewBag.Categories = context.Categories.ToList();
            return View("productManager");
        }
        public ActionResult editProduct(int id)
        {
            Product pd = context.Products.FirstOrDefault(p => p.id == id);
            return View(pd);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {

            Product pd = context.Products.FirstOrDefault(p => p.id == product.id);

            pd.name = product.name;
            pd.price = product.price;
            pd.descriptions = product.descriptions;
            pd.image = product.image;

            context.SaveChanges();
            return View("productManager", context.Products.ToList());
        }
        public ActionResult Filter(int id)
        {
            ViewBag.categories = context.Categories.ToList();
            return View("ListProduct", context.Products.Where(p => p.categoryId.Equals(id)).ToList());
        }
        [HttpPost]
        public ActionResult Find(string txtKeyWord)
        {
            ViewBag.categories = context.Categories.ToList();
            var list = context.Products.Where(p => p.descriptions.Contains(txtKeyWord)).ToList();
            return View("ListProduct", list);
        }

        [HttpGet]
        [ActionName("Login")]
        public ActionResult Login_get()
        {
            return View();
        }
        [HttpPost]
        [ActionName("Login")]
        public ActionResult Login_Post(string email, string password)
        {
            var login = context.Users.Where(p => p.Email.Equals(email) && p.Password.Equals(password)).FirstOrDefault();
            if(login!=null)
            {
                HttpCookie cookie = new HttpCookie("user", email.ToString());
                cookie.Expires.AddHours(8);
                HttpContext.Response.SetCookie(cookie);
                return View("Index");
            }
            else
            {
                ViewBag.Message = "Opps. Wrong username or password";
                return View();
            }
        }
        [HttpGet]
        [ActionName("Register")]
        public ActionResult Register_get()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Register")]
        public ActionResult Register_post(string name, string address, string email, string phone, string password)
        {
            var existuser = context.Users.Where(p => p.Email.Equals(email)).FirstOrDefault();
            if (existuser == null)
            {
                User usr = new User();
                usr.Name = name;
                usr.Address = address;
                usr.Email = email;
                usr.Password = password;
                usr.Phone = phone;
                context.Users.Add(usr);
                context.SaveChanges();
                return View("Login");
            }
            else
            {
                ViewBag.Message = "This email have been used. Please try with another email";
                return View();
            }
        }
        public ActionResult Logout()
        {
            var c = new HttpCookie("user");
            c.Expires = DateTime.Now.AddSeconds(1);
            Response.Cookies.Add(c);
            
            return RedirectToAction("Index");
        }
    }
}