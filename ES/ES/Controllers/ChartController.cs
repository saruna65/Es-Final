using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ES.Models;

namespace ES.Controllers
{
	public class ChartController : Controller
	{
		EntitiesPie db = new EntitiesPie();

		EntitiesCustomer dbCustomer = new EntitiesCustomer();

		DB dborder = new DB();

		public ActionResult Index()
		{
			if (Session["UserName"] == null || Session["UserName"].ToString() != "Admin")
			{
				return RedirectToAction("Login", "Login");
			}

			int totalOrders = dborder.Orders.Count();
			var products = db.Products.ToList();
			var categories = new List<string> { "Roasted Currry Powder", "Pepper Powder", "Curry Powder", "Chilli Pieces", "Chilli Powder", "Turmeric Powder" };
			var data = new List<int>();
			var customerCount = dbCustomer.Customers.Count();


			foreach (var category in categories)
			{
				var count = products.Where(p =>
					(p.Productname != null && p.Productname.Contains(category)) ||
					(p.Productname2 != null && p.Productname2.Contains(category)) ||
					(p.Productname3 != null && p.Productname3.Contains(category)) ||
					(p.Productname4 != null && p.Productname4.Contains(category)) ||
					(p.Productname5 != null && p.Productname5.Contains(category)) ||
					(p.Productname6 != null && p.Productname6.Contains(category)))
					.Sum(p => (p.Productname != null && p.Productname.Contains(category) && p.Qty.HasValue ? p.Qty.Value : 0) +
							  (p.Productname2 != null && p.Productname2.Contains(category) && p.Qty2.HasValue ? p.Qty2.Value : 0) +
							  (p.Productname3 != null && p.Productname3.Contains(category) && p.Qty3.HasValue ? p.Qty3.Value : 0) +
							  (p.Productname4 != null && p.Productname4.Contains(category) && p.Qty4.HasValue ? p.Qty4.Value : 0) +
							  (p.Productname5 != null && p.Productname5.Contains(category) && p.Qty5.HasValue ? p.Qty5.Value : 0) +
							  (p.Productname6 != null && p.Productname6.Contains(category) && p.Qty6.HasValue ? p.Qty6.Value : 0));

				data.Add(count);
			}


			var chartData = new ChartDataModel
			{
				Categories = categories,
				Data = data,
				CustomerCount = customerCount,
				TotalOrders = totalOrders
			};

			return View(chartData);

		}

		
	}
}
