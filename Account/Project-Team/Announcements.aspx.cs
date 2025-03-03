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
        SqlCommand cmd12 = new SqlCommand("SELECT * FROM AnnouncementThread, Login where Login.Email=AnnouncementThread.Email ORDER BY Date Desc", con);
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
                rptOrders.DataSource = GetData(string.Format("SELECT * FROM AnnouncementReply, Login where Login.Email=AnnouncementReply.Email and AnnouncementReply.ThreadId='{0}'  ORDER BY AnnouncementReply.Date Desc", threadId));
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
    
}