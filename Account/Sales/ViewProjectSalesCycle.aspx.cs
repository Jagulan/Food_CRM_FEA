using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;


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

        String all = "SELECT Projects.*, Company.Name as CompanyName FROM Projects INNER JOIN Company ON Projects.Company = Company.Id WHERE Projects.Id = '" + Request.QueryString["ProjectId"] + "'";

        SqlCommand cmd = new SqlCommand(all, c);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        r1.DataSource = dt;
        r1.DataBind();

        String all1 = "SELECT ProjectSalesCycleStage.*, Contacts.Name as ContactName FROM ProjectSalesCycleStage INNER JOIN Contacts ON ProjectSalesCycleStage.POC = Contacts.Id WHERE ProjectSalesCycleStage.ProjectId =  '" + Request.QueryString["ProjectId"] + "'";

        //String all = "Select * from Contacts";
        SqlCommand cmd12 = new SqlCommand(all1, c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

        SqlDataAdapter adp = new SqlDataAdapter("Select DISTINCT Contacts.Name as ContactName, Contacts.Id as ContactId from Contacts, Company, Projects where Contacts.Company = Projects.Company and Projects.Id = '" + Request.QueryString["ProjectId"] + "'", c);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        ddlPOC.DataSource = ds;
        ddlPOC.DataTextField = "ContactName";
        ddlPOC.DataValueField = "ContactId";
        ddlPOC.DataBind();
        ddlPOC.Items.Insert(0, new ListItem("--Select Point Of Contact--", ""));


        SqlCommand cmd44 = new SqlCommand("SELECT CurrentStage FROM Projects WHERE Id = @ProjectId", c);
        cmd44.Parameters.AddWithValue("@ProjectId", Request.QueryString["ProjectId"]);
        SqlDataReader dr44 = cmd44.ExecuteReader();

        if (dr44.Read())
        {
            lblLatestStage.Text = dr44["CurrentStage"].ToString();
        }
        PopulateStageDropDown();
        dr44.Close();
        cmd44.Dispose();
    }

    private void PopulateStageDropDown()
    {
        ddlStage.Items.Clear();

        ddlStage.Visible = true;
        ddlPOC.Visible = true;
        btnGroup.Visible = true;
        btnTLead.Visible = false;
        switch (lblLatestStage.Text)
        {
            case "Cycle Not Yet Started":
                ddlStage.Items.Add(new ListItem("Prospect", "Prospect"));
                break;
            case "Prospect":
                ddlStage.Items.Add(new ListItem("Lead Qualification", "Lead Qualification"));
                break;
            case "Lead Qualification":
                ddlStage.Items.Add(new ListItem("Initial Meeting", "Initial Meeting"));
                break;
            case "Initial Meeting":
                ddlStage.Items.Add(new ListItem("Proposal", "Proposal"));
                break;
            case "Proposal":
                ddlStage.Items.Add(new ListItem("Deal Closure", "Deal Closure"));
                break;
            case "Deal Closure":

                ddlStage.Visible = false;
                ddlPOC.Visible = false;
                btnGroup.Visible = false;
                btnTLead.Visible = true;
                lblMsg.Text = "Congratulations on successfully closing the deal!\r\n\r\n\r\n";
                break;
            default:
                ddlStage.Items.Add(new ListItem("Select Sales Cycle Stage", ""));
                break;
        }
    }




    protected void btnAssign_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssignTeamLead.aspx?ProjectId=" + Request.QueryString["ProjectId"] + "");

    }



    protected void btnAddClasses_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {
            // Insert into ProjectSalesCycleStage table
            SqlCommand cmd = new SqlCommand("insert into ProjectSalesCycleStage values('" + guid + "', '" + DateTime.Today.ToShortDateString() + "', '" + ddlStage.SelectedValue + "', '" + ddlPOC.SelectedValue + "',  '" + Request.QueryString["ProjectId"] + "')", c, trans);
            cmd.ExecuteNonQuery();

            // Update Project table with the selected stage
            SqlCommand updateCmd = new SqlCommand("UPDATE Projects SET CurrentStage = @SelectedStage WHERE Id = @ProjectId", c, trans);
            updateCmd.Parameters.AddWithValue("@SelectedStage", ddlStage.SelectedValue);
            updateCmd.Parameters.AddWithValue("@ProjectId", Request.QueryString["ProjectId"]);
            updateCmd.ExecuteNonQuery();

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


    protected void Order_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "view")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }

            Response.Redirect("DiscussionForum.aspx?StageId=" + e.CommandArgument + "");

        }
    }

    protected void btnClient_Click(object sender, EventArgs e)
    {
        Response.Redirect("ClientCred.aspx?ProjectId=" + Request.QueryString["ProjectId"] + "");

    }

}