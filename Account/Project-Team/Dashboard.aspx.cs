using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection c = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                c.Open();
                //if (Request.QueryString["CourseName"] != null)
                //{
                //lblCN.Text = Request.QueryString["CourseName"];

                //String dte = DateTime.Now.ToString("yyyy-MM-dd");
                String all = "SELECT DISTINCT Projects.*, Company.Name AS CompanyName FROM Projects INNER JOIN Company ON Projects.Company = Company.Id INNER JOIN ProjectTeamLead ON Projects.Id = ProjectTeamLead.ProjectId WHERE Projects.CurrentStage = 'Deal Closure' and ProjectTeamLead.TeamLeadEmail='" + Session["user"].ToString() + "'";

                SqlCommand cmd = new SqlCommand(all, c);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();


                String all33 = "SELECT DISTINCT Projects.*, Company.Name AS CompanyName FROM Projects INNER JOIN Company ON Projects.Company = Company.Id INNER JOIN ProjectTeamMember ON Projects.Id = ProjectTeamMember.ProjectId WHERE Projects.CurrentStage = 'Deal Closure' and ProjectTeamMember.TeamMemberEmail='" + Session["user"].ToString() + "'";

                SqlCommand cmd33 = new SqlCommand(all33, c);
                SqlDataAdapter da33 = new SqlDataAdapter(cmd33);
                DataTable dt33 = new DataTable();
                da33.Fill(dt33);
                r2.DataSource = dt33;
                r2.DataBind();

                //}


                c.Close();
            }
            catch (Exception e1)
            {
                lblGMsg.Text = "Something went wrong...";
            }
        }
    }
}