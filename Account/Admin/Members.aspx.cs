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
                BindRepeater();
                
              
                c.Close();

            }
            catch (Exception ex)
            {
                lblGMsg.Text = ex.Message;
            }

        }
    }

    private void BindRepeater()
    {
        String all = "Select * from Login where Type != 'Admin'";
        SqlCommand cmd12 = new SqlCommand(all, c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Members.DataSource = dt12;
        Members.DataBind();
    }

    protected void btnAddMembers_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into Login values('"+txtEmail.Value+"','" + txtName.Value+ "', '"+txtPassword.Value+"', '"+ddlType.SelectedValue+"','')", c,trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtEmail.Value = "";
            txtPassword.Value = "";

            trans.Commit();
        }
        catch (Exception e1)
        {
            lblMsg.Text = e1.Message;
            trans.Rollback();
        }
        finally
        {
            BindRepeater();
            c.Close();
        }
    }


    protected void Members_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from Login where Email = @Email", c);
            cmd.Parameters.AddWithValue("@Email", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater();
        }
    }
}