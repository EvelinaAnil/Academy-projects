using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class Static : System.Web.UI.Page
    {
        private static int _count = 1;

        public static int Count
        {
            get { return _count; }
            set
            {
                lock (typeof(int))
                {
                    _count = value;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Count++;
            Response.Write($"Count: {Count}");
        }
    }
}