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
        SqlDataAdapter adp = new SqlDataAdapter("SELECT Email, Name FROM Login WHERE Type='Project-Team' AND Email NOT IN (SELECT TeamLeadEmail FROM ProjectTeamLead  Where ProjectId='"+ Request.QueryString["ProjectId"] + "')", c);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        // Concatenate Email and Name into a single field
        DataTable dt = ds.Tables[0];
        dt.Columns.Add("EmailAndName", typeof(string), "Email + ' - ' + Name");

        ddlTeamLead.DataSource = dt;
        ddlTeamLead.DataTextField = "EmailAndName"; // Use the concatenated field as the display text
        ddlTeamLead.DataValueField = "Email"; // Use Email as the value field
        ddlTeamLead.DataBind();
        ddlTeamLead.Items.Insert(0, new ListItem("--Select TeamLead--", ""));


        String all = "SELECT ProjectTeamLead.*, Login.Name as TeamLeadName FROM ProjectTeamLead INNER JOIN Login ON ProjectTeamLead.TeamLeadEmail = Login.Email Where ProjectId='"+ Request.QueryString["ProjectId"] + "'";
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
            SqlCommand cmd = new SqlCommand("delete from ProjectTeamLead where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
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
            SqlCommand cmd = new SqlCommand("insert into ProjectTeamLead values('" + guid + "', '" + DateTime.Today.ToShortDateString() + "', '" + ddlTeamLead.SelectedValue + "', '"+ Request.QueryString["ProjectId"] + "')", c, trans);
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