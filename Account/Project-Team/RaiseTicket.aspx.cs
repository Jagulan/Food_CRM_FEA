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




                c.Close();
            }
            catch (Exception ex)
            {
                lblGMsg.Text = ex.Message;
            }

        }
    }

    protected void btnGroup_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into Ticket values('" + guid + "', '" + DateTime.Now.ToString() + "', '" + txtName.Value + "', '" + txtDesc.Value + "', '" + Request.QueryString["ProjectId"] + "', '" + ddlPriority.SelectedValue + "', '" + Session["User"].ToString() + "', 'Open')", c, trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtDesc.Value = "";
            trans.Commit();
        }
        catch (Exception e1)
        {
            lblMsg.Text = e1.Message;
            trans.Rollback();
        }
        finally
        {
            
            c.Close();
        }
    }
}