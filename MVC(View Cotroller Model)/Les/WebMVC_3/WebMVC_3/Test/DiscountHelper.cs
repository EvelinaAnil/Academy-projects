using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC_3.Test
{
    public class DiscountHelper
    {
        //price > 1000 -> 10%
        // price from 100 to 1000 -> 5%
        // price < 100 -> 0
        // price is negative -> exception 
        public decimal Discount(decimal price)
        {
            if (price > 1000) 
            {
                return price * 0.9m ;
            }
            return price;

            
        }
    }
}