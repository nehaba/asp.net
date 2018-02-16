using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eshopper_Project
{
    public class SessionVariables
    {
        public static int UserID
        {
            get
            {
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["UserID"] != null && HttpContext.Current.Session["UserID"] != string.Empty)
                {
                    return Convert.ToInt32(HttpContext.Current.Session["UserID"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                HttpContext.Current.Session["UserID"] = value;
            }
        }

        public static string Firstname
        {
            get
            {
                if (HttpContext.Current.Session != null && HttpContext.Current.Session["Firstname"] != null)
                {
                    return Convert.ToString(HttpContext.Current.Session["Firstname"]);
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                HttpContext.Current.Session["Firstname"] = value;
            }
        }
    }
}