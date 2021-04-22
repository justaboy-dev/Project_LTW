using ProjectCCS.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectCCS.ViewsModel;
using System.ComponentModel.DataAnnotations;

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
        [HttpGet]
        [ActionName("ChangePass")]
        public ActionResult ChangePass_Get()
        {
            return View();
        }
        [HttpPost]
        [ActionName("ChangePass")]
        public ActionResult ChangePass_Post(FormCollection frm)
        {
            var user = getUser();
            User usr = context.Users.Where(p => p.Email.Equals(user)).FirstOrDefault();
            if(!usr.Password.Trim().Equals(frm.Get("oldpass")))
            {
                ModelState.AddModelError("", "Password does not match");
                return View();
            }
            if(!frm.Get("newpass").Equals(frm.Get("renewpass")))
            {
                ModelState.AddModelError("", "New password and Re-new does not match");
                return View();
            }    
            usr.Password = frm.Get("newpass");
            context.Entry(usr).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
            return RedirectToAction("Logout");
        }
        public ActionResult ShoppingCart()
        {
            if (!CheckLogin())
                return RedirectToAction("Login");

            var usr = getUser();
            ViewBag.ShoppingCart = context.ShoppingCarts.Join(
                context.Products,
                p=>p.id,
                q=>q.id,
                (p,q)=>new {p,q}
                )
                .Where(p => p.p.Email.Equals(usr))
                .Select(p => new ShoppingCartVM
                {
                    id = p.q.id,
                    name = p.q.name,
                    image = p.q.image,
                    price = p.q.price,
                    Amount = p.p.Amount,
                })
                .ToList();
            ViewBag.User = context.Users.Where(p => p.Email.Equals(usr)).FirstOrDefault();
            return View();
        }
        public ActionResult AddToCart(int id)
        {
            var email = getUser();
            ShoppingCart sc = context.ShoppingCarts.Where(p => p.Email.Equals(email) && p.id.Equals(id)).FirstOrDefault();
            if(sc==null)
            {
                sc = new ShoppingCart();
                sc.Email = email;
                sc.id = id;
                sc.Amount = 1;
                context.ShoppingCarts.Add(sc);
                context.SaveChanges();
            }
            else
            {
                sc.Amount++;
                context.Entry(sc).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
            return RedirectToAction("ListProduct");
        }
        public ActionResult RemoveCart(int id)
        {
            var user = getUser();
            ShoppingCart spc = context.ShoppingCarts.Where(p => p.Email.Equals(user) && p.id.Equals(id)).FirstOrDefault();
            if(spc!=null)
            {
                context.ShoppingCarts.Remove(spc);
                context.SaveChanges();
            }
            return RedirectToAction("ShoppingCart");
        }
        [HttpPost]
        public ActionResult UpdateCart(FormCollection frm)
        {
            var user = getUser();
            var id = int.Parse(frm.Get("id"));
            ShoppingCart spc = context.ShoppingCarts.Where(p => p.Email.Equals(user) && p.id.Equals(id)).FirstOrDefault();
            if(spc!=null)
            {
                spc.Amount = int.Parse(frm.Get("amount"));
                context.Entry(spc).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
            return RedirectToAction("ShoppingCart");
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
                return RedirectToAction("Login");
            }
            else
            {
                var usremail = getUser();
                User usr = context.Users.Where(p => p.Email.Equals(usremail)).FirstOrDefault();
                return View(usr);
            }
        }
        [HttpPost]
        public ActionResult Update(User user)
        {
            if(!ModelState.IsValidField("Phone"))
            {
                return View();
            }    
            var usermail = getUser();
            User usr = context.Users.Where(p => p.Email.Equals(usermail)).FirstOrDefault();
            usr.Name = user.Name.Trim();
            usr.Phone = user.Phone.Trim();
            usr.Address = user.Address.Trim();
            context.Entry(usr).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
            return RedirectToAction("UserDashBoard");
        }

        public ActionResult productManager()
        {
            List<Product> list = context.Products.ToList();
            ViewBag.lst = list;
            ViewBag.Categories = context.Categories.ToList();
            return View();
        }
        public void SavefileToServer(HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
            {
                var filename = Path.GetFileName(file.FileName);
                var path = Path.Combine(Server.MapPath("~/app/img/coffee"), filename);
                file.SaveAs(path);
            }
        }
        [HttpPost]
        public ActionResult Add(Product product, HttpPostedFileBase file)
        {

            if (file != null && file.ContentLength > 0)
            {
                SavefileToServer(file);
                product.image = String.Concat("/app/img/coffee/", Path.GetFileName(file.FileName));
                context.Products.Add(product);
                context.SaveChanges();
            }
            return RedirectToAction("productManager");
        }
        public ActionResult deleteProduct(int id)
        {
            Product pd = context.Products.FirstOrDefault(p => p.id == id);

            context.Products.Remove(pd);
            context.SaveChanges();

            return RedirectToAction("productManager");
        }
        public ActionResult editProduct(int id)
        {
            Product pd = context.Products.FirstOrDefault(p => p.id == id);
            return View(pd);
        }

        [HttpPost]
        public ActionResult Edit(Product product, HttpPostedFileBase file)
        {

            Product pd = context.Products.FirstOrDefault(p => p.id == product.id);

            pd.name = product.name.Trim();
            pd.price = product.price;
            pd.descriptions = product.descriptions.Trim();
            pd.image = product.image;

            context.SaveChanges();
            return RedirectToAction("productManager");
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
        public ActionResult Login_Post(User user)
        {
            if (!ModelState.IsValidField("Email"))
            {
                return View();
            }
            var login = context.Users.Where(p => p.Email.Equals(user.Email) && p.Password.Equals(user.Password)).FirstOrDefault();
            if(login!=null)
            {
                HttpCookie cookie = new HttpCookie("user", user.Email.ToString());
                cookie.Expires.AddHours(8);
                HttpContext.Response.SetCookie(cookie);
                return RedirectToAction("Index");
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
        public ActionResult Register_post(User user)
        {
            if(!ModelState.IsValid)
            {
                return View();
            }
            if (context.Users.Where(p => p.Email.Equals(user.Email)).FirstOrDefault() != null)
            {
                ModelState.AddModelError("", "Email have been used!");
                return View();
            }
            context.Users.Add(user);
            context.SaveChanges();
            return RedirectToAction("Login");
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