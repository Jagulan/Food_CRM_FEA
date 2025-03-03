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

        SqlCommand cmd44 = new SqlCommand("SELECT CurrentStage FROM Projects WHERE Id = @ProjectId", c);
        cmd44.Parameters.AddWithValue("@ProjectId", Request.QueryString["ProjectId"]);
        SqlDataReader dr44 = cmd44.ExecuteReader();

        if (dr44.Read())
        {
            lblLatestStage.Text = dr44["CurrentStage"].ToString();
        }
        dr44.Close();
        cmd44.Dispose();
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