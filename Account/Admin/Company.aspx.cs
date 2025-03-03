using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


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
        String all = "Select * from Company";
        SqlCommand cmd12 = new SqlCommand(all, c);
        SqlDataAdapter da12 = new SqlDataAdapter(cmd12);
        DataTable dt12 = new DataTable();
        da12.Fill(dt12);
        Order.DataSource = dt12;
        Order.DataBind();

    }
    
    protected void Order_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from Company where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater();
        }
    }
}