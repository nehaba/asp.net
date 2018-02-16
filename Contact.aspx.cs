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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeaderLabel = (Label)Page.Master.FindControl("Headerlabel");
            lblHeaderLabel.Text = "Contact Us";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddInquiry();
        }

        public void AddInquiry()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "u_addInquiry";
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = txtName.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Subject", SqlDbType.VarChar).Value = txtSubject.Text;
                    cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = txtmassage.Text;
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

    }
}