using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


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

                SqlDataAdapter adp = new SqlDataAdapter("Select * from Milestones where ProjectId='" + Request.QueryString["ProjectId"] + "' ", c);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                ddlMilestone.DataSource = ds;
                ddlMilestone.DataTextField = "Name";
                ddlMilestone.DataValueField = "Id";
                ddlMilestone.DataBind();
                ddlMilestone.Items.Insert(0, new ListItem("--Select Milestone--", ""));

                SqlDataAdapter adp333 = new SqlDataAdapter(@"SELECT DISTINCT l.Email, l.Name + ' (' + l.Email + ')' AS DisplayName FROM Login l JOIN (SELECT TeamMemberEmail AS Email FROM ProjectTeamMember WHERE projectId = @ProjectId UNION ALL SELECT TeamLeadEmail AS Email FROM ProjectTeamLead WHERE projectId = @ProjectId) AS CombinedEmails ON l.Email = CombinedEmails.Email", c);


                adp333.SelectCommand.Parameters.AddWithValue("@ProjectId", Request.QueryString["ProjectId"]);

                DataSet ds333 = new DataSet();
                adp333.Fill(ds333);

                ddlMember.DataSource = ds333;
                ddlMember.DataTextField = "DisplayName"; // Display Name (Email)
                ddlMember.DataValueField = "Email";      // Save Email only
                ddlMember.DataBind();
                ddlMember.Items.Insert(0, new ListItem("--Select Member--", ""));



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
            string Deadline = txtDate.Text + " " + txtTime.Text;
            SqlCommand cmd = new SqlCommand("insert into Tasks values('" + guid + "', '" + DateTime.Now.ToString() + "', '" + txtName.Value + "', '" + txtDesc.Value + "', '" + Request.QueryString["ProjectId"] + "', '" + ddlMilestone.SelectedValue + "', '" + ddlMember.SelectedValue + "','" + Session["User"].ToString() + "', '" + Deadline + "', 'Open', '')", c, trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtDesc.Value = "";
            txtTime.Text = "";
            txtDate.Text = "";
            ddlMilestone.Text = "";
            ddlMember.Text = "";
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