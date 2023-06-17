using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ES.Models
{
	public class ChartDataModel
	{
		public List<string> Categories { get; set; }
		public List<int> Data { get; set; }
		public int CustomerCount { get; set; }
		public int TotalOrders { get; set; }
	}
}
