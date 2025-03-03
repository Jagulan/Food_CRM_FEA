using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
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




    private void BindRepeater()
    {
        SqlCommand cmd12 = new SqlCommand("SELECT (SELECT TOP 1 Tasks.Deadline FROM Tasks WHERE Tasks.ProjectId = '" + Request.QueryString["ProjectId"] + "' AND Tasks.MilestoneId = Milestones.Id ORDER BY Tasks.Deadline DESC) AS LastDate, Milestones.Id AS Id, Milestones.Name AS Name, Milestones.Description AS Description, Milestones.Date AS Date, Milestones.ProjectId AS ProjectId FROM Milestones INNER JOIN Projects ON Projects.Id = Milestones.ProjectId WHERE Milestones.ProjectId = '" + Request.QueryString["ProjectId"] + "' and Milestones.Id='" + ddlMilestone.SelectedValue + "' ORDER BY Milestones.Date DESC", c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

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
            
            ddlMember.Text = "";
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

    protected void ddlMilestone_TextChanged(object sender, EventArgs e)
    {
        BindRepeater();
    }

    protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from Tasks where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater();
        }
    }
}