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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeaderLabel = (Label)Page.Master.FindControl("Headerlabel");
            lblHeaderLabel.Text = "Shopping Cart";
            if (!IsPostBack)
            {
                GetProductsFromCart(SessionVariables.UserID);
            }
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            UpdateTotal();
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in rptCart.Items)
            {
                HiddenField hdnId = (HiddenField)item.FindControl("hdnId");
                int ID = Convert.ToInt32(hdnId.Value);
                TextBox qty = (TextBox)item.FindControl("txtQty");
                Label prize = (Label)item.FindControl("lblPrize");
                int totalQty = Convert.ToInt32(qty.Text);
                decimal finalSubtotal = Convert.ToDecimal(prize.Text);
                Label total = (Label)item.FindControl("lblTotalPrize");
                total.Text = Convert.ToString(finalSubtotal * totalQty);
                AddUpdateProductToCart(ID, totalQty);
            }
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
                    GetProductsFromCart(SessionVariables.UserID);
                    break;
                case "clearAll":
                    //Code to delete all record                    
                    DeleteAllFromCart();
                    GetProductsFromCart(SessionVariables.UserID);
                    break;

                case "Continue":
                    Response.Redirect("Home.aspx");
                    break;
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
            //UpdateTotal();
        }

        public void UpdateTotal()
        {
            decimal total = 0;
            foreach (RepeaterItem item in rptCart.Items)
            {
                TextBox qty = (TextBox)item.FindControl("txtQty");
                Label subtotal = (Label)item.FindControl("lblPrize");
                int totalQty = Convert.ToInt32(qty.Text);
                decimal finalSubtotal = Convert.ToDecimal(subtotal.Text);
                total += finalSubtotal * totalQty;

            }
            lblSubtotal.Text = total.ToString();
            lblTotal.Text = total.ToString();
        }

        public void DeleteAllFromCart()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "u_deleteProductFromCart";
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
            cmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = 0;
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

        public void AddUpdateProductToCart(int ItemId,int totalQty)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "u_addUpdateProductToCart";
            cmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = ItemId;
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
            cmd.Parameters.Add("@Qty", SqlDbType.Int).Value = totalQty;
            cmd.Parameters.Add("@CartPKId", SqlDbType.Int).Value = 2;
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
    }
}