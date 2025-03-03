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

                BindRepeater1();



                SqlDataAdapter adp = new SqlDataAdapter("Select * from MilestonePackage", c);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                ddlShowMilestone.DataSource = ds;
                ddlShowMilestone.DataTextField = "PackageName";
                ddlShowMilestone.DataValueField = "Id";
                ddlShowMilestone.DataBind();
                ddlShowMilestone.Items.Insert(0, new ListItem("--Select Milestone Package--", ""));


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
            SqlCommand cmd = new SqlCommand("insert into MileStones values('" + guid + "', '" + DateTime.Now.ToString() + "', '" + txtName.Value + "', '" + txtDesc.Value + "', '" + Request.QueryString["ProjectId"] + "')", c, trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtDesc.Value = "";
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


    private void BindRepeater()
    {

        String all3 = "SELECT Id, Date, Name, Description FROM MilestonePackageItems WHERE MilestonePackageId = '" + ddlShowMilestone.SelectedValue + "'";

        SqlCommand cmd3 = new SqlCommand(all3, c);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        r3.DataSource = dt3;
        r3.DataBind();
    }

    protected void ddlShowMilestone_TextChanged(object sender, EventArgs e)
    {
        BindRepeater();

    }
    protected void AddPackage_Click(object sender, EventArgs e)
    {
        // Open the connection
        c.Open();
        SqlTransaction trans = c.BeginTransaction();

        try
        {


            // Loop through repeater items to insert milestone items
            foreach (RepeaterItem item in r3.Items)
            {

                Guid guid = Guid.NewGuid();

                // Find controls within the repeater item
                Label lblName = (Label)item.FindControl("lblTeamLead");
                Label lblDescription = (Label)item.FindControl("Label2");

                // Get milestone name and description
                string milestoneName = lblName.Text;
                string milestoneDescription = lblDescription.Text;

                // Insert into MileStones table
                SqlCommand cmd = new SqlCommand("insert into MileStones values('" + guid + "', '" + DateTime.Now.ToString() + "', @MilestoneName, @MilestoneDescription, '" + Request.QueryString["ProjectId"] + "')", c, trans);
                cmd.Parameters.AddWithValue("@MilestoneName", milestoneName);
                cmd.Parameters.AddWithValue("@MilestoneDescription", milestoneDescription);
                cmd.ExecuteNonQuery();
            }

            // Commit the transaction if everything succeeds
            trans.Commit();
            lblMsgPackage.Text = "Milestone Template was added successfully!";
            BindRepeater1();
        }
        catch (Exception e1)
        {
            // Rollback the transaction in case of any exception
            lblMsgPackage.Text = e1.Message;
            trans.Rollback();
        }
        finally
        {
            // Close the connection
            c.Close();
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

    private void BindRepeater1()
    {
        SqlCommand cmd12 = new SqlCommand("SELECT (SELECT TOP 1 Tasks.Deadline FROM Tasks WHERE Tasks.ProjectId = '" + Request.QueryString["ProjectId"] + "' AND Tasks.MilestoneId = Milestones.Id ORDER BY Tasks.Deadline DESC) AS LastDate, Milestones.Id AS Id, Milestones.Name AS Name, Milestones.Description AS Description, Milestones.Date AS Date, Milestones.ProjectId AS ProjectId FROM Milestones INNER JOIN Projects ON Projects.Id = Milestones.ProjectId WHERE Milestones.ProjectId = '" + Request.QueryString["ProjectId"] + "' ORDER BY Milestones.Date DESC", c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

    }
    protected void ddlMilestone_TextChanged(object sender, EventArgs e)
    {
        BindRepeater1();
    }

    protected void Orders_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from Milestones where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater1();
        }
    }

}