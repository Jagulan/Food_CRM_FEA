using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection c = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                c.Open();
                //if (Request.QueryString["CourseName"] != null)
                //{
                //lblCN.Text = Request.QueryString["CourseName"];

                //String dte = DateTime.Now.ToString("yyyy-MM-dd");
                String all = "SELECT DISTINCT  Projects.Id as Id, Projects.Name from Projects, Company, Login, Contacts where Company.Id = Projects.Company  and Contacts.Company = Company.Id and Login.Email='" + Session["user"].ToString() + "' and Login.Email = Contacts.Email";

                SqlCommand cmd = new SqlCommand(all, c);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();


                //}


                c.Close();
            }
            catch (Exception e1)
            {
                lblGMsg.Text = "Something went wrong...";
            }
        }
    }
}