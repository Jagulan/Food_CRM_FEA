using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;
using System.Activities.Statements;
using System.Drawing;
using System.Web.UI.HtmlControls;


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
                // Check if the logged-in user is a team leader
                bool isTeamLeader = IsTeamLeader();

                // Set the visibility of the addmember panel based on whether the user is a team leader
                addmember.Visible = isTeamLeader;

                c.Close();
            }
            catch (Exception ex)
            {
                lblGMsg.Text = ex.Message;
            }

        }
    }

    protected void r1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Panel adminoptions = e.Item.FindControl("adminoptions") as Panel;
            // Access adminoptions and perform any necessary operations
            if (adminoptions != null)
            {
                bool isTeamLeader = IsTeamLeader();
                adminoptions.Visible = isTeamLeader;
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

        String all23 = "SELECT ProjectTeamLead.*, Login.Name as TeamLeadName, ProjectTeamLead.TeamLeadEmail FROM ProjectTeamLead INNER JOIN Login ON ProjectTeamLead.TeamLeadEmail = Login.Email Where ProjectId='" + Request.QueryString["ProjectId"] + "'";
        SqlCommand cmd23 = new SqlCommand(all23, c);
        SqlDataAdapter da23 = new SqlDataAdapter(cmd23);
        DataTable dt23 = new DataTable();
        da23.Fill(dt23);
        TeamLead.DataSource = dt23;
        TeamLead.DataBind();

        String all213 = "SELECT ProjectTeamMember.*, Login.Name as TeamMemberName, ProjectTeamMember.TeamMemberEmail FROM ProjectTeamMember INNER JOIN Login ON ProjectTeamMember.TeamMemberEmail = Login.Email Where ProjectId='" + Request.QueryString["ProjectId"] + "'";
        SqlCommand cmd213 = new SqlCommand(all213, c);
        SqlDataAdapter da213 = new SqlDataAdapter(cmd213);
        DataTable dt213 = new DataTable();
        da213.Fill(dt213);
        TeamMember.DataSource = dt213;
        TeamMember.DataBind();

        SqlDataAdapter adp44 = new SqlDataAdapter("SELECT Email, Name FROM Login WHERE Type='Project-Team' AND Email NOT IN (SELECT TeamLeadEmail FROM ProjectTeamLead  Where ProjectId='" + Request.QueryString["ProjectId"] + "') AND Email NOT IN (SELECT TeamMemberEmail FROM ProjectTeamMember  Where ProjectId='" + Request.QueryString["ProjectId"] + "')", c);
        DataSet ds44 = new DataSet();
        adp44.Fill(ds44);
        // Concatenate Email and Name into a single field
        DataTable dt44 = ds44.Tables[0];
        dt44.Columns.Add("EmailAndName", typeof(string), "Email + ' - ' + Name");

        ddlMember.DataSource = dt44;
        ddlMember.DataTextField = "EmailAndName"; // Use the concatenated field as the display text
        ddlMember.DataValueField = "Email"; // Use Email as the value field
        ddlMember.DataBind();
        ddlMember.Items.Insert(0, new ListItem("--Select Member--", ""));


        SqlCommand cmd12 = new SqlCommand("SELECT (SELECT TOP 1 Tasks.Deadline FROM Tasks WHERE Tasks.ProjectId = '"+ Request.QueryString["ProjectId"] + "' AND Tasks.MilestoneId = Milestones.Id ORDER BY Tasks.Deadline DESC) AS LastDate, Milestones.Id AS Id, Milestones.Name AS Name, Milestones.Description AS Description, Milestones.Date AS Date, Milestones.ProjectId AS ProjectId FROM Milestones INNER JOIN Projects ON Projects.Id = Milestones.ProjectId WHERE Milestones.ProjectId = '"+ Request.QueryString["ProjectId"] + "' ORDER BY Milestones.Date DESC", c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();
    }
    private static DataTable GetData(string query)
    {

        using (SqlConnection con = ConnectionString.getConnection())
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = query;
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
        }

    }
    protected void Order_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //try
        //{
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            string threadId = (e.Item.FindControl("hfThreadId") as HiddenField).Value;
            Repeater rptOrders = e.Item.FindControl("rptOrders") as Repeater;
            rptOrders.DataSource = GetData(string.Format("SELECT Tasks.Status, Tasks.Id, Tasks.Name, Tasks.Description, Tasks.DateCreated, Tasks.ProjectId, Tasks.MilestoneId,  Tasks.CloseDate, Tasks.AssignedTo, Tasks.Deadline FROM Tasks, Projects where Projects.Id = Tasks.ProjectId and Tasks.MilestoneId='{0}' ORDER BY Tasks.DateCreated Desc", threadId));
            rptOrders.DataBind();
        }
        if (Order.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                HtmlGenericControl dvNoRec = e.Item.FindControl("dvNoRecords") as HtmlGenericControl;
                if (dvNoRec != null)
                {
                    dvNoRec.Visible = true;
                }
            }
        }
        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("~/404.aspx");
        //}



    }



    protected void btnAddClasses_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into ProjectTeamMember values('" + guid + "', '" + DateTime.Today.ToShortDateString() + "', '" + ddlMember.SelectedValue + "', '" + Request.QueryString["ProjectId"] + "')", c, trans);
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

    // Method to check if the logged-in user is a team leader
    private bool IsTeamLeader()
    {
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM ProjectTeamLead WHERE ProjectId = @ProjectId AND TeamLeadEmail = @UserEmail", c);
        cmd.Parameters.AddWithValue("@ProjectId", Request.QueryString["ProjectId"]);
        cmd.Parameters.AddWithValue("@UserEmail", Session["user"].ToString());

        int count = (int)cmd.ExecuteScalar();
        return count > 0; // Returns true if the user is a team leader, false otherwise
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
}