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
using System.Activities.Statements;
using System.Security.Cryptography.X509Certificates;

public partial class student_Subject : System.Web.UI.Page
{
    SqlConnection con = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { 
        
        //    try
        //    {
               
                BindRepeater();
            //}
            //catch (Exception ex)
            //{
            //    Response.Redirect("~/404.aspx");
            //}
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
        SqlCommand cmd12 = new SqlCommand("SELECT * FROM ForumThread, Login where Login.Email=ForumThread.Email ORDER BY Date Desc", con);
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
        con.Open();
        Guid EMPID = Guid.NewGuid();

        SqlCommand cmd = new SqlCommand("insert into ForumThread values('" + EMPID + "','" + txtDF.Text + "','" + Session["User"].ToString() + "','" + DateTime.Now.ToString() + "')", con);
        cmd.ExecuteNonQuery();
        lblMessage.Text = "Thread added successfully...";
        txtDF.Text = "";       
        BindRepeater();
        con.Close();

        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("~/404.aspx");
        //}
    }
    protected void Order_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //try
        //{
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                string threadId = (e.Item.FindControl("hfThreadId") as HiddenField).Value;
                Repeater rptOrders = e.Item.FindControl("rptOrders") as Repeater;
                rptOrders.DataSource = GetData(string.Format("SELECT * FROM ForumReply, Login where Login.Email=ForumReply.Email and ForumReply.ThreadId='{0}'  ORDER BY ForumReply.Date Desc", threadId));
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
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter("insert into ForumReply values('" + EMPID + "','" + e.CommandArgument + "','" + Reply + "','" + Session["User"].ToString() + "','" + DateTime.Now.ToString() + "')", con);
                adp.SelectCommand.Parameters.AddWithValue("@Id", e.CommandArgument);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                BindRepeater();
                con.Close();
            }
        }
        //}
        //catch (Exception ex)
        //{
        //    Response.Redirect("~/404.aspx");
        //}
    }
    
}