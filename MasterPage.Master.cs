using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eshopper_Project
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            switch (Convert.ToString(Session["Theme"]))
            {
                case "0":
                    Page.Theme = "RedTheme";
                    break;
                case "1":
                    Page.Theme = "GreenTheme";
                    break;
                default:
                    Page.Theme = "RedTheme";
                    break;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpTheme.Items.Add(new ListItem("Red", "0", true));
                drpTheme.Items.Add(new ListItem("Green", "1", true));
                if (!string.IsNullOrEmpty(Convert.ToString(Session["Theme"])))
                {
                    drpTheme.SelectedValue = Convert.ToString(Session["Theme"]);
                }
            }
            SessionCheck();
        }
        
        protected void drpTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Theme"] = drpTheme.SelectedValue;
            Response.Redirect("Home.aspx");
        }

        protected void logoutuser_Click(object sender, EventArgs e)
        {
            SessionVariables.UserID = 0;
            SessionVariables.Firstname = null;
            Response.Redirect("home.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Login();
        }
        
        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":
                    //Code to delete the particular record
                    HiddenField hdnId = (HiddenField)e.Item.FindControl("hdnId");
                    int ID = Convert.ToInt32(hdnId.Value);
                    DeleteProductFromCart(ID);
                    GetProductsFromCart(ID);
                    break;
            }
        }
        
        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        public void DeleteProductFromCart(int ID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "u_deleteProductFromCart";
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
            cmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = ID;
            SqlParameter outPutParameter = new SqlParameter();
            outPutParameter.ParameterName = "@Result";
            outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
            outPutParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outPutParameter);
            cmd.Connection = conn;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
        }

        public void GetProductsFromCart(int UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("u_getProductsFromCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserID;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            rptCart.DataSource = ds;
            rptCart.DataBind();
            conn.Close();
            UpdateTotal();
        }

        public void SessionCheck()
        {
            if (SessionVariables.UserID != 0 && SessionVariables.Firstname != null)
            {
                int UserID = SessionVariables.UserID;
                string Firstname = SessionVariables.Firstname;
                profileLink.Visible = true;
                logoutuser.Visible = true;
                loginUser.Visible = false;
                menDropdown.Attributes.Add("class", "dropdown-toggle");
                menDropdown.Attributes.Add("data-toggle", "dropdown");
                menDropdown.Attributes.Add("href", "Product.aspx?category=men");
                womenDropdown.Attributes.Add("href", "Product.aspx?category=women");
                kidsDropdown.Attributes.Add("href", "Product.aspx?category=kids");
                accDropdown.Attributes.Add("href", "Product.aspx?category=accessories");
                hlBag.Attributes.Add("CssClass", "dropdown-toggle sprite bag");
                hlBag.Attributes.Add("data-toggle", "dropdown");
                hlHome.Attributes.Add("href", "Home.aspx");
                hlAboutUs.Attributes.Add("href", "AboutUs.aspx");

            }
        }

        public void UpdateTotal()
        {
            decimal total = 0;
            foreach (RepeaterItem item in rptCart.Items)
            {
                Label Te = (Label)item.FindControl("lblQty");
                HiddenField hdnTotal = (HiddenField)item.FindControl("hdnTotal");
                int qty = Convert.ToInt32(Te.Text);
                decimal subtotal = Convert.ToDecimal(hdnTotal.Value);
                total += subtotal * qty;

            }
            lblTotal.Text = total.ToString();
        }

        public void Login()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_validateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = loginuname.Text.Trim();
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = loginpassword.Text.Trim();
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        int UserID = (int)dr["ID"];
                        string Firstname = (string)dr["FirstName"];
                        conn.Close();
                        SessionVariables.UserID = UserID;
                        SessionVariables.Firstname = Firstname;
                        profileLink.Visible = true;
                        logoutuser.Visible = true;
                        loginUser.Visible = false;
                        hlHome.Attributes.Add("href", "home.aspx");
                        hlAboutUs.Attributes.Add("href", "aboutUs.aspx");
                        menDropdown.Attributes.Add("class", "dropdown-toggle");
                        menDropdown.Attributes.Add("data-toggle", "dropdown");
                        menDropdown.Attributes.Add("href", "Product.aspx?category=men");
                        womenDropdown.Attributes.Add("href", "Product.aspx?category=women");
                        kidsDropdown.Attributes.Add("href", "Product.aspx?category=kids");
                        accDropdown.Attributes.Add("href", "Product.aspx?category=accessories");
                        hlBag.Attributes.Add("CssClass", "dropdown-toggle sprite bag");
                        hlBag.Attributes.Add("data-toggle", "dropdown");
                        bool isValidate = true;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "SetLocalStorageData", "SetLocalStorageData('" + UserID + "','" + Firstname + "','" + isValidate + "')", true);
                        GetProductsFromCart(UserID);
                    }
                }
            }
        }
    }
}