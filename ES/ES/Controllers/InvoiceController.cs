using ES.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace ES.Controllers
{
    public class InvoiceController : Controller
    {
		DB dB = new DB();
		// GET: Invoice
		public ActionResult Index()
        {
			if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
			{
				return RedirectToAction("Login", "Login");
			}

			using (DB db = new DB())
            {
				
				var list = db.Orders.Include("product").ToList();
				return View(list);
			}
            
        }

        [HttpGet]
        public ActionResult InvoiceCreate() 
        {
			if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
			{
				return RedirectToAction("Login", "Login");
			}

			return View();
        }

        [HttpPost]
        public ActionResult InvoiceCreate(InvoiceVM obj) 
        {
			
			Product p = new Product();
			p.Productname = obj.Productname;
			p.Qty = obj.Qty;
			p.UnitPrice = obj.UnitPrice;
			p.Productname2 = obj.Productname2;
			p.Qty2 = obj.Qty2;
			p.UnitPrice2 = obj.UnitPrice2;
			p.Productname3 = obj.Productname3;
			p.Qty3 = obj.Qty3;
			p.UnitPrice3 = obj.UnitPrice3;
			p.Productname4 = obj.Productname4;
			p.Qty4 = obj.Qty4;
			p.UnitPrice4 = obj.UnitPrice4;
			p.Productname5 = obj.Productname5;
			p.Qty5 = obj.Qty5;
			p.UnitPrice5 = obj.UnitPrice5;
			p.Productname6 = obj.Productname6;
			p.Qty6 = obj.Qty6;
			p.UnitPrice6 = obj.UnitPrice6;

			dB.Products.Add(p);
			dB.SaveChanges();

			Order o = new Order();
			o.OrderId = obj.OrderId;
			o.CustomerName = obj.CustomerName;
			o.CustomerAddress = obj.CustomerAddress;
			o.Phone = obj.Phone;
			o.OrderDate = obj.OrderDate;
			o.OrderTotal = obj.OrderTotal;
			o.ProductId = p.ProductId;
			dB.Orders.Add(o);
			dB.SaveChanges();

			return RedirectToAction("Index");


		}
		public ActionResult Details(int? OrderId)
		{
			if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
			{
				return RedirectToAction("Login", "Login");
			}

			if (OrderId == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			using (DB db = new DB())
			{
				var order = db.Orders.Include("Product").FirstOrDefault(o => o.OrderId == OrderId);

				if (order == null)
				{
					return HttpNotFound();
				}

				return View(order);
			}
		}


		[HttpGet]
		public ActionResult Delete(int? OrderId)
		{
			if (Session["UserName"] == null || string.IsNullOrEmpty(Session["UserName"].ToString()))
			{
				return RedirectToAction("Login", "Login");
			}

			if (OrderId == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			using (DB db = new DB())
			{
				var order = db.Orders.Include("Product").FirstOrDefault(o => o.OrderId == OrderId);

				if (order == null)
				{
					return HttpNotFound();
				}

				return View(order);
			}
		}

		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int OrderId)
		{
			using (DB db = new DB())
			{
				var order = db.Orders.FirstOrDefault(o => o.OrderId == OrderId);

				if (order == null)
				{
					return HttpNotFound();
				}

				// Delete the corresponding product as well
				var product = db.Products.FirstOrDefault(p => p.ProductId == order.ProductId);
				if (product != null)
				{
					db.Products.Remove(product);
				}

				db.Orders.Remove(order);
				db.SaveChanges();
			}

			return RedirectToAction("Index");
		}



	}

}