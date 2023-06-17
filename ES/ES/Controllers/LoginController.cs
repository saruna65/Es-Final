using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ES.Models;

namespace ES.Controllers
{
    public class LoginController : Controller
    {

        EntitiesLogin db=new EntitiesLogin();
		private readonly EntitiesLogin _dbContext;

		public LoginController()
		{
			_dbContext = new EntitiesLogin();
		}
		[HttpGet]
        public ActionResult Login()
        {
            return View();
        }


		[HttpPost]
		public ActionResult Login(Login model)
		{
			var user = _dbContext.Logins.FirstOrDefault(u => u.User_Name == model.User_Name && u.Password == model.Password);
			if (user != null)
			{
				if (user.User_Name == "Admin")
				{
					Session["UserName"] = user.User_Name;
					return RedirectToAction("Index", "Chart");
				}
				Session["UserName"] = user.User_Name;
				return RedirectToAction("Index", "Customers");
			}
			else
			{
				ModelState.AddModelError("", "Invalid username or password.");
				TempData["ErrorMessage"] = "Invalid username or password.";
				return View(model);

			}
		}

		public ActionResult Logout()
		{
			Session.Abandon();
			Response.Cache.SetCacheability(HttpCacheability.NoCache);
			Response.Cache.AppendCacheExtension("no-store, must-revalidate");
			Response.Expires = -1;
			Response.AppendHeader("Pragma", "no-cache");

			return RedirectToAction("Login", "Login");
		}

	}
}
