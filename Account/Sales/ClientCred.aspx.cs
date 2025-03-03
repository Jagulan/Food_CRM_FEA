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
        SqlDataAdapter adp = new SqlDataAdapter("SELECT Contacts.Email AS Email, Contacts.Name AS Name FROM Contacts, Company, Projects WHERE Projects.Id='" + Request.QueryString["ProjectId"] + "' AND Contacts.Company = Company.Id AND Company.Id = Projects.Company AND NOT EXISTS (SELECT 1 FROM Login WHERE Login.Email = Contacts.Email)", c);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        // Concatenate Email and Name into a single field
        DataTable dt = ds.Tables[0];
        dt.Columns.Add("EmailAndName", typeof(string), "Email + ' - ' + Name");

        ddlTeamLead.DataSource = dt;
        ddlTeamLead.DataTextField = "EmailAndName"; // Use the concatenated field as the display text
        ddlTeamLead.DataValueField = "Email"; // Use Email as the value field
        ddlTeamLead.DataBind();
        ddlTeamLead.Items.Insert(0, new ListItem("--Select Client--", ""));


        String all = "SELECT Distinct Contacts.Email AS Email, Contacts.Name AS Name, Login.Password as Password FROM Contacts, Company, Projects, Login WHERE Projects.Id='" + Request.QueryString["ProjectId"] + "' AND Contacts.Company = Company.Id AND Company.Id = Projects.Company AND Contacts.Email IN (SELECT Email FROM Login)";
        SqlCommand cmd12 = new SqlCommand(all, c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

    }

    protected void Order_ItemCommand(object source, RepeaterCommandEventArgs e)
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

    protected void btnAddClasses_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {

            string selectedEmailAndName = ddlTeamLead.SelectedItem.Text; // Get the selected item's concatenated EmailAndName
            string[] parts = selectedEmailAndName.Split(new string[] { " - " }, StringSplitOptions.None); // Split the concatenated string
            string selectedName = parts[1]; // Extract the name, assuming it's the second part after splitting



            SqlCommand cmd = new SqlCommand("insert into Login values( '" + ddlTeamLead.SelectedValue + "', '" + selectedName + "', '123','Client','')", c, trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
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