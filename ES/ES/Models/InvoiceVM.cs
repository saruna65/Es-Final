using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ES.Models
{
	public class InvoiceVM
	{

		public int OrderId { get; set; }

		public string CustomerName { get; set; }

		public string CustomerAddress { get; set; }

		public string Phone { get; set; }

		public string Productname { get; set; }

		public Nullable<int> Qty { get; set; }

		public Nullable<double> UnitPrice { get; set; }

		public Nullable<System.DateTime> OrderDate { get; set; }

		public Nullable<decimal> OrderTotal { get; set; }

		public string Productname2 { get; set; }

		public Nullable<int> Qty2 { get; set; }

		public Nullable<double> UnitPrice2 { get; set; }

		public string Productname3 { get; set; }

		public Nullable<int> Qty3 { get; set; }

		public Nullable<double> UnitPrice3 { get; set; }

		public string Productname4 { get; set; }

		public Nullable<int> Qty4 { get; set; }

		public Nullable<double> UnitPrice4 { get; set; }

		public string Productname5 { get; set; }

		public Nullable<int> Qty5 { get; set; }

		public Nullable<double> UnitPrice5 { get; set; }

		public string Productname6 { get; set; }

		public Nullable<int> Qty6 { get; set; }

		public Nullable<double> UnitPrice6 { get; set; }
	}

	
}