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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblHeaderLabel = (Label)Page.Master.FindControl("Headerlabel");
            lblHeaderLabel.Text = "Register";
            if (!IsPostBack)
            {
                Bind_Country();
                Bind_shippingCountry();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            CustomerRegistration();
        }

        protected void txtscontry_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_shippingState();
        }

        protected void txtbcontry_SelectedIndexChanged(object sender, EventArgs e)
        {
            Bind_billingState();
        }

        public void CustomerRegistration()
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
                    //string iDate = datepicker.Text;
                    //DateTime oDate = DateTime.Parse(iDate);
                    //DateTime validDate = oDate.Day + " " + oDate.Month + "  " + oDate.Year;
                    //System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
                    //dateInfo.ShortDatePattern = "MM/dd/yyyy";
                    //DateTime validDate = Convert.ToDateTime(datepicker.Text, dateInfo);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "u_addUpdateUser";
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
                    cmd.Parameters.Add("@BillingStateId", SqlDbType.Int).Value = Convert.ToInt32(txtbstate.SelectedValue);
                    cmd.Parameters.Add("@BillingCountryId", SqlDbType.Int).Value = Convert.ToInt32(txtbcontry.SelectedValue);
                    cmd.Parameters.Add("@ShippingStreet", SqlDbType.VarChar).Value = txtsstreet.Text;
                    cmd.Parameters.Add("@ShippingCity", SqlDbType.VarChar).Value = txtscity.Text;
                    cmd.Parameters.Add("@ShippingStateId", SqlDbType.Int).Value = txtsstate.SelectedValue;
                    cmd.Parameters.Add("@ShippingCountryId", SqlDbType.Int).Value = txtscontry.SelectedValue;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = 0;
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

        public void Bind_Country()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_getCountriesOrStates", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@type", SqlDbType.Int).Value = 1;
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    txtbcontry.DataSource = dr;
                    txtbcontry.Items.Clear();
                    txtbcontry.Items.Insert(0,"--Please Select country--");
                    txtbcontry.DataTextField = "Name";
                    txtbcontry.DataValueField = "Id";
                    txtbcontry.DataBind();
                    conn.Close();
                }
            }

        }
        public void Bind_shippingCountry()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_getCountriesOrStates", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@type", SqlDbType.Int).Value = 1;
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    txtscontry.DataSource = dr;
                    txtscontry.Items.Clear();
                    txtscontry.Items.Insert(0, "--Please Select country--");
                    txtscontry.DataTextField = "Name";
                    txtscontry.DataValueField = "Id";
                    txtscontry.DataBind();
                    conn.Close();
                }
            }

        }

        public void Bind_billingState()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_getCountriesOrStates", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@type", SqlDbType.Int).Value = 2;
                    cmd.Parameters.Add("@CountryId", SqlDbType.Int).Value = txtbcontry.SelectedValue;
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    txtbstate.DataSource = dr;
                    txtbstate.Items.Clear();
                    txtbstate.Items.Add("--Please Select state--");
                    txtbstate.DataTextField = "Name";
                    txtbstate.DataValueField = "Id";
                    txtbstate.DataBind();
                    conn.Close();
                }
            }
        }

        public void Bind_shippingState()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["clsConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("u_getCountriesOrStates", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@type", SqlDbType.Int).Value = 2;
                    cmd.Parameters.Add("@CountryId", SqlDbType.Int).Value = txtscontry.SelectedValue;
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    txtsstate.DataSource = dr;
                    txtsstate.Items.Clear();
                    txtsstate.Items.Add("--Please Select state--");
                    txtsstate.DataTextField = "Name";
                    txtsstate.DataValueField = "Id";
                    txtsstate.DataBind();
                    conn.Close();
                }
            }
        }
    }
}