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
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeaderLabel = (Label)Page.Master.FindControl("Headerlabel");
            lblHeaderLabel.Text = "Profile";
            GetUserProfile();
        }
        public void GetUserProfile()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_getUserProfile", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    DataTable dt1 = ds.Tables[0];
                    DataTable dt2 = ds.Tables[1];
                    DataTable dt3 = ds.Tables[2];

                    try
                    {
                        conn.Open();
                        txtUsername.Text = dt1.Rows[0]["UserName"].ToString();
                        txtPassword.Attributes.Add("value", Convert.ToString(dt1.Rows[0]["Password"]));
                        txtFirstname.Text = dt1.Rows[0]["FirstName"].ToString();
                        txtLastname.Text = dt1.Rows[0]["LastName"].ToString();
                        string gender = dt1.Rows[0]["Gender"].ToString();
                        txtMobile.Text = dt1.Rows[0]["Mobile"].ToString();
                        txtEmail.Text = dt1.Rows[0]["Email"].ToString();
                        txtPhone.Text = dt1.Rows[0]["Phone"].ToString();
                        datepicker.Text = dt1.Rows[0]["BirthDate"].ToString();
                        txtbstreet.Text = dt2.Rows[0]["Street"].ToString();
                        txtbcity.Text = dt2.Rows[0]["City"].ToString();
                        //txtbcontry.SelectedValue = dt2.Rows[0]["CountryId"].ToString();
                        //txtbstate.SelectedValue = dt2.Rows[0]["StateId"].ToString();
                        txtsstreet.Text = dt3.Rows[0]["Street"].ToString();
                        txtscity.Text = dt3.Rows[0]["City"].ToString();
                        //txtscontry.SelectedValue = dt3.Rows[0]["CountryId"].ToString();
                        //txtsstate.SelectedValue = dt3.Rows[0]["StateId"].ToString();

                        if (gender.Equals("Female"))
                        {
                            female.Checked = true;
                        }
                        else
                        {
                            male.Checked = true;
                        }
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
        protected void submit_Click(object sender, EventArgs e)
        {
            UpdateUserProfile();
        }
        public void UpdateUserProfile()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string gender;
                    if (male.Checked == true)
                    {
                        gender = "M";
                    }
                    else
                    {
                        gender = "F";
                    }
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "u_addUpdateUser";
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = SessionVariables.UserID;
                    cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = txtUsername.Text;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = txtPassword.Text;
                    cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstname.Text;
                    cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastname.Text;
                    cmd.Parameters.Add("@Gender", SqlDbType.Char).Value = gender;
                    cmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = txtMobile.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Phone", SqlDbType.VarChar).Value = txtPhone.Text;
                    cmd.Parameters.Add("@BirthDate", SqlDbType.VarChar).Value = datepicker.Text;
                    cmd.Parameters.Add("@BillingStreet", SqlDbType.VarChar).Value = txtbstreet.Text;
                    cmd.Parameters.Add("@BillingCity", SqlDbType.VarChar).Value = txtbcity.Text;
                    cmd.Parameters.Add("@BillingStateId", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@BillingCountryId", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@ShippingStreet", SqlDbType.VarChar).Value = txtsstreet.Text;
                    cmd.Parameters.Add("@ShippingCity", SqlDbType.VarChar).Value = txtscity.Text;
                    cmd.Parameters.Add("@ShippingStateId", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@ShippingCountryId", SqlDbType.Int).Value = 1;
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
                    catch(Exception e)
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