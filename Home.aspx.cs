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
    public partial class Home : System.Web.UI.Page
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
            System.Web.UI.HtmlControls.HtmlGenericControl currdiv = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("headerImage");
            currdiv.Style.Add("display", "none");
            if (!IsPostBack)
            {
                GetProducts();
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
    }
}