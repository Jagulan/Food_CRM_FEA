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
        SqlDataAdapter adp = new SqlDataAdapter("Select * from Company ", c);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        ddlCompany.DataSource = ds;
        ddlCompany.DataTextField = "Name";
        ddlCompany.DataValueField = "Id";
        ddlCompany.DataBind();
        ddlCompany.Items.Insert(0, new ListItem("--Select Company--", ""));

        String all = "SELECT Contacts.*, Company.Name as CompanyName FROM Contacts INNER JOIN Company ON Contacts.Company = Company.Id";
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
            SqlCommand cmd = new SqlCommand("insert into Contacts values('" + guid + "', '" + DateTime.Today.ToShortDateString() + "', '" + txtName.Value + "', '" + txtPosition.Value + "', '" + txtMobile.Value + "', '" + txtEmail.Value + "', '" + ddlCompany.SelectedValue + "')", c, trans);

            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtEmail.Value = "";
            txtMobile.Value = "";
            txtPosition.Value = "";
           
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