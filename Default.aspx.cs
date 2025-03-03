using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    SqlConnection c = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
            {

                txtEmail.Text = Request.Cookies["Email"].Value;
                txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            c.Open();
            SqlCommand cmd = new SqlCommand("select * from Login where Email ='" + txtEmail.Text + "' ", c);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["Password"].ToString() == txtPassword.Text)
                {

                    Session["User"] = txtEmail.Text;
                    if (chkRememberMe.Checked)
                    {
                        Response.Cookies["Email"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

                    }
                    Response.Cookies["Email"].Value = txtEmail.Text.Trim();
                    Response.Cookies["Password"].Value = txtPassword.Text.Trim();

                    if (dr["Type"].ToString() == "Admin")
                    {
                        Response.Redirect("~/Account/Admin/Dashboard.aspx");
                    }
                    if (dr["Type"].ToString() == "Project-Team")
                    {
                        Response.Redirect("~/Account/Project-Team/Dashboard.aspx");
                    }
                    if (dr["Type"].ToString() == "Sales")
                    {
                        Response.Redirect("~/Account/Sales/Dashboard.aspx");
                    }
                    if (dr["Type"].ToString() == "Client")
                    {
                        Response.Redirect("~/Account/Client/Dashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid credentials!";
                }
            }
            else
            {
                lblMessage.Text = "Invalid credentials!";
            }

        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }

        c.Close();

    }
}