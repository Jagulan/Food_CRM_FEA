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
        String all = "Select * from Company";
        SqlCommand cmd12 = new SqlCommand(all, c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

    }

    protected void btnAddClasses_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {



            SqlCommand cmd = new SqlCommand("insert into Company values('" + guid + "', '" + DateTime.Today.ToShortDateString() + "', '" + txtName.Value + "', '"+txtDesc.Value+"', '"+txtAddress.Value+"', '"+txtPhone.Value+"', '"+txtEmail.Value+"')", c, trans);
           
           
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtDesc.Value = "";
            txtEmail.Value = "";
            txtPhone.Value = "";
            txtAddress.Value = "";
            
            trans.Commit();
            BindRepeater();
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