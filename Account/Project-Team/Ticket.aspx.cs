using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Purchase : System.Web.UI.Page
{
    SqlConnection c = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                c.Open();

                SqlCommand cmd110 = new SqlCommand("Select Name from Projects where Id='" + Request.QueryString["ProjectId"] + "'", c);
                SqlDataReader dr110 = cmd110.ExecuteReader();
                if (dr110.Read())
                {

                    lblCompanyName.Text = dr110["Name"].ToString();
                }
                dr110.Close();


                SqlCommand cmd = new SqlCommand("Select Id from Projects where Id='" + Request.QueryString["ProjectId"] + "'", c);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();

                SqlCommand cmd1 = new SqlCommand("Select * from Ticket where ProjectId='" + Request.QueryString["ProjectId"] + "'", c);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                da1.Fill(dt1);
                r2.DataSource = dt1;
                r2.DataBind();
                    
                c.Close();
            }
            catch (Exception ex)
            {
                lblGMsg.Text = ex.Message;
            }

        }
    }
    
}