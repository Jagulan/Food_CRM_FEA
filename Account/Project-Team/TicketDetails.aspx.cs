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
                if (Request.QueryString["TicketId"] != null)
                {
                    Session["TicketId"] = Request.QueryString["TicketId"];
                    btnCloseTickets.Visible = false;
                    c.Open();

                    SqlCommand cmd110 = new SqlCommand("Select Projects.Name from Ticket, Projects where Ticket.Id='" + Request.QueryString["TicketId"] + "' and Projects.Id = Ticket.ProjectId ", c);
                    SqlDataReader dr110 = cmd110.ExecuteReader();
                    if (dr110.Read())
                    {

                        lblCompanyName.Text = dr110["Name"].ToString();
                    }
                    dr110.Close();

                    SqlCommand cmd = new SqlCommand("Select Ticket.Id as TicketId, Ticket.ProjectId as ProjectId, Ticket.RaisedBy, Ticket.DateCreated, Ticket.Name, Ticket.Description, Ticket.Priority, Login.Name as RaisedByName from Ticket, Login where Ticket.Id='" + Request.QueryString["TicketId"] + "' and Ticket.RaisedBy = Login.Email", c);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    r1.DataSource = dt;
                    r1.DataBind();


                    SqlCommand cmd22 = new SqlCommand("Select Login.Name as UserName, TicketClosureRequest.Email, TicketClosureRequest.DateTime from TicketClosureRequest, Login where TicketId='" + Request.QueryString["TicketId"] + "' and Login.Email = TicketClosureRequest.Email ", c);
                    SqlDataAdapter da22 = new SqlDataAdapter(cmd22);
                    DataTable dt22 = new DataTable();
                    da22.Fill(dt22);
                    r2.DataSource = dt22;
                    r2.DataBind();



                    SqlCommand cmd11110 = new SqlCommand("Select * from Ticket where Ticket.Id='" + Request.QueryString["TicketId"] + "' ", c);
                    SqlDataReader dr11110 = cmd11110.ExecuteReader();
                    if (dr11110.Read())
                    {
                        if (dr11110["Status"].ToString() == "Closed")
                        {
                            lblStatus.Text = "Status : Closed";
                            btnCloseTickets.Visible = false;
                        }
                        else
                        {
                            btnCloseTickets.Visible = true;

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
        SqlCommand cmd12 = new SqlCommand("SELECT * FROM TicketDiscussionForumThread, Login where Login.Email=TicketDiscussionForumThread.Email and TicketDiscussionForumThread.TicketId='" + Request.QueryString["TicketId"] + "' ORDER BY Date Desc", c);
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

        SqlCommand cmd = new SqlCommand("insert into TicketDiscussionForumThread values('" + EMPID + "','" + txtDF.Text + "','" + Session["User"].ToString() + "','" + Request.QueryString["TicketId"] + "','" + DateTime.Now.ToString() + "')", c);
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
                rptOrders.DataSource = GetData(string.Format("SELECT * FROM TicketDiscussionForumReply, Login where Login.Email=TicketDiscussionForumReply.Email and TicketDiscussionForumReply.ThreadId='{0}'  ORDER BY TicketDiscussionForumReply.Date Desc", threadId));
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

                SqlDataAdapter adp = new SqlDataAdapter("insert into TicketDiscussionForumReply values('" + EMPID + "','" + e.CommandArgument + "','" + Reply + "','" + Session["User"].ToString() + "','" + Request.QueryString["TicketId"] + "','" + DateTime.Now.ToString() + "')", c);
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
 

    protected void btnCloseTickets_Click(object sender, EventArgs e)
    {
        c.Open();
        SqlCommand cmd3 = new SqlCommand("Update Ticket set Status='Closed' where Id='" + Request.QueryString["TicketId"] + "'", c);
        cmd3.ExecuteNonQuery();
        c.Close();
        lblStatus.Text = "Status : Closed";
        btnCloseTickets.Visible = false;

    }

}
