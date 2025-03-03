using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;



public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = ConnectionString.getConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Default.aspx");

            }
            else
            {
                con.Open();
                SqlCommand cmd10 = new SqlCommand("Select Email, Type from Login where Email='" + Session["user"].ToString() + "'", con);
                SqlDataReader dr10 = cmd10.ExecuteReader();
                if (dr10.Read())
                {
                    name.Text = "  " + dr10["Email"].ToString() + "      ";
                    type.Text = "  " + dr10["Type"].ToString() + "      ";

                }
                con.Close();
            }
        }
    }
}
