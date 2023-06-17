using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ES.Models
{
	public class DB:DbContext
	{
		public DbSet<Order> Orders { get; set; }
		
		public DbSet<Product> Products { get; set; }

	}
}