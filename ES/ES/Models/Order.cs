using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ES.Models
{
	public class Order
	{
		

		public int OrderId { get; set; }

		public string CustomerName { get; set; }

		public string CustomerAddress { get; set; }

		public string Phone { get; set; }

		[DisplayFormat(DataFormatString = "{0:d}")]
		public Nullable<System.DateTime> OrderDate { get; set; }

		[DisplayFormat(DataFormatString = "{0:N}")]
		public Nullable<decimal> OrderTotal { get; set; }

		

		public Nullable<int> ProductId { get; set; }

		//public virtual Product Product { get; set; }

		[ForeignKey("ProductId")]

		public Product product { get; set; }

	}
}