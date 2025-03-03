using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;



public partial class Purchase : System.Web.UI.Page
{
    SqlConnection c = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                if (Request.QueryString["TaskId"] != null)
                {
                    Session["TaskId"] = Request.QueryString["TaskId"];
                    btnCloseTasks.Visible = false;
                    c.Open();
                   
                    SqlCommand cmd110 = new SqlCommand(" SELECT Projects.Name as ProjectName, Company.Name as CompanyName FROM Milestones, Projects, Tasks, Company where Projects.Id = Milestones.ProjectId and Milestones.ProjectId = Projects.Id and Tasks.Id  = '" + Request.QueryString["TaskId"] + "' and Tasks.MilestoneId = Milestones.Id and Projects.Company = Company.Id ORDER BY Milestones.Date Desc", c);
                    SqlDataReader dr110 = cmd110.ExecuteReader();
                    if (dr110.Read())
                    {

                        lblTaskName.Text = dr110["CompanyName"].ToString()  +" : "+dr110["ProjectName"].ToString();
                    }
                    dr110.Close();
                    //SqlCommand cmd1 = new SqlCommand("Select * from Tasks where TaskId='" + Request.QueryString["TaskId"] + "'  + Session["User"].ToString() + "' and Tasks.TollGateId = TollGates.Id and Tasks.MilestoneId = Milestones.Id", c);
                    



                    SqlCommand cmd1 = new SqlCommand("Select Tasks.Description,Tasks.AssignedTo,Tasks.Id as TaskId, Tasks.Name,Tasks.Deadline,Tasks.DateCreated, Milestones.Name as MilestoneName,  Milestones.Description as MilestoneDescription from Tasks, Milestones where Tasks.Id='" + Request.QueryString["TaskId"] + "' and Tasks.MilestoneId = Milestones.Id", c);
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    r1.DataSource = dt;
                    r1.DataBind();


                    SqlCommand cmd11110 = new SqlCommand("Select * from Tasks where Tasks.Id='" + Request.QueryString["TaskId"] + "' ", c);
                    SqlDataReader dr11110 = cmd11110.ExecuteReader();
                    if (dr11110.Read())
                    {
                        if (dr11110["Status"].ToString() == "Open" || dr11110["Status"].ToString() == "Requested for closure")
                        {
                            lblStatus.Text = "Status : " + dr11110["Status"].ToString();
                            btnCloseTasks.Visible = true;
                        }

                        if (dr11110["Status"].ToString() == "Closed")
                        {
                            btnCloseTasks.Visible = false;
                            lblStatus.Text = "Status : " + dr11110["Status"].ToString();
                        }
                    }
                    dr11110.Close();
                    
                    c.Close();
                }
                BindRepeater();
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
        SqlCommand cmd12 = new SqlCommand("SELECT * FROM TaskDiscussionForumThread, Login where Login.Email=TaskDiscussionForumThread.Email and TaskDiscussionForumThread.TaskId='" + Request.QueryString["TaskId"] + "' ORDER BY Date Desc", c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //try
        //{
        c.Open();
        Guid EMPID = Guid.NewGuid();

        SqlCommand cmd = new SqlCommand("insert into TaskDiscussionForumThread values('" + EMPID + "','" + txtDF.Text + "','" + Session["User"].ToString() + "','" + Request.QueryString["TaskId"] + "','" + DateTime.Now.ToString() + "')", c);
        cmd.ExecuteNonQuery();
        lblMessage.Text = "Thread added successfully...";
        txtDF.Text = "";
        BindRepeater();
        c.Close();

        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("~/404.aspx");
        //}
    }
    protected void Order_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                string threadId = (e.Item.FindControl("hfThreadId") as HiddenField).Value;
                Repeater rptOrders = e.Item.FindControl("rptOrders") as Repeater;
                rptOrders.DataSource = GetData(string.Format("SELECT * FROM TaskDiscussionForumReply, Login where Login.Email=TaskDiscussionForumReply.Email and TaskDiscussionForumReply.ThreadId='{0}'  ORDER BY TaskDiscussionForumReply.Date Desc", threadId));
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
        }
        catch (Exception ex)
        {
            Response.Redirect("~/404.aspx");
        }



    }
    protected void Order_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //try
        //{
        if (e.CommandName == "Submit")
        {
            string Reply = ((TextBox)e.Item.FindControl("txtReply")).Text;
            FileUpload ReplyImage = e.Item.FindControl("ReplyImage") as FileUpload;
            if (Reply != "" || ReplyImage.ToString() != "")
            {
                Guid EMPID = Guid.NewGuid();
                c.Open();

                SqlDataAdapter adp = new SqlDataAdapter("insert into TaskDiscussionForumReply values('" + EMPID + "','" + e.CommandArgument + "','" + Reply + "','" + Session["User"].ToString() + "','" + Request.QueryString["TaskId"] + "','" + DateTime.Now.ToString() + "')", c);
                adp.SelectCommand.Parameters.AddWithValue("@Id", e.CommandArgument);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                BindRepeater();

                c.Close();


            }
        }
        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("~/404.aspx");
        //}
    }
    

    protected void btnCloseTasks_Click(object sender, EventArgs e)
    {
        c.Open();
        Guid EMPID = Guid.NewGuid();

        SqlCommand cmd3 = new SqlCommand("Update Tasks set Status='Closed', CloseDate='"+ DateTime.Now.ToString() + "' where Id = '" + Request.QueryString["TaskId"] + "' ", c);
        cmd3.ExecuteNonQuery();
        c.Close();

        btnCloseTasks.Visible = false;
        lblStatus.Text = "Status : Closed";
    }



}