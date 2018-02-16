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
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeaderLabel = (Label)Page.Master.FindControl("Headerlabel");
            lblHeaderLabel.Text = "Men";
            if (!IsPostBack)
            {
                GetProducts();
                GroupBy();
            }
        }
        protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "cart":
                    HiddenField hdnId = (HiddenField)e.Item.FindControl("hdnId");
                    int ID = Convert.ToInt32(hdnId.Value);
                    AddUpdateProductToCart(ID);
                    break;
            }
        }
        public void GetProducts()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_getProducts", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            IDataReader idr = cmd.ExecuteReader();
            dlProduct.DataSource = idr;
            dlProduct.DataBind();
            idr.Close();
            conn.Close();
        }
        public void AddUpdateProductToCart(int ID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "u_addUpdateProductToCart";
            //HiddenField hdnId = (HiddenField)dlProduct.FindControl("hdnId");
            //HiddenField hdnId = (HiddenField)e.Item.FindControl("hdnId");
            cmd.Parameters.Add("@ItemId", SqlDbType.Int).Value = ID;
            cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
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

        protected void shortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected = shortBy.SelectedValue;
            if (selected.Equals("PRICE") || selected.Equals("NAME"))
            {
                GetProducts(selected);
            }
        }
        public void GetProducts(string selected)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_getProducts", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OrderBy", SqlDbType.VarChar).Value = selected + "#ASC";
            conn.Open();
            IDataReader idr = cmd.ExecuteReader();
            dlProduct.DataSource = idr;
            dlProduct.DataBind();
            idr.Close();
            conn.Close();
        }
        public void GroupBy()
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("usp_getProductsGroupBy", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            DataTable dt = ds.Tables[3];
            gridCategory.DataSource = dt;
            gridCategory.DataBind();
            conn.Close();


            gridCategory.HeaderRow.Cells[1].Visible = gridCategory.HeaderRow.Cells[2].Visible = gridCategory.HeaderRow.Cells[3].Visible = false;
            foreach (GridViewRow gvr in gridCategory.Rows)
            {
                gvr.Cells[1].Visible = gvr.Cells[2].Visible  = gvr.Cells[3].Visible = false;
            }

        }

        protected void gridCategory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.BorderStyle = BorderStyle.None;
                tc.BorderWidth = 0;
                tc.BorderColor = System.Drawing.Color.Transparent;
            }
        }
    }
}