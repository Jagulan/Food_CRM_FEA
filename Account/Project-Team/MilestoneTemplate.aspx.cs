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
                SqlCommand cmd110 = new SqlCommand("SELECT Projects.*, Company.Name as CompanyName FROM Projects INNER JOIN Company ON Projects.Company = Company.Id WHERE Projects.Id = '" + Request.QueryString["ProjectId"] + "'", c);
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

            SqlCommand cmd = new SqlCommand("insert into MilestonePackageItems values('" + guid + "', '" + DateTime.Now.ToString() + "', '" + txtName.Value + "', '" + txtDesc.Value + "', '" + ddlMilestone.SelectedValue + "')", c, trans);
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data saved";
            txtName.Value = "";
            txtDesc.Value = "";

            trans.Commit();
            ddlShowMilestone.Text = ddlMilestone.SelectedValue;
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



    protected void btnGroupMilestonePackage_Click(object sender, EventArgs e)
    {
        Guid guid = Guid.NewGuid();
        c.Open();
        SqlTransaction trans = c.BeginTransaction();
        try
        {
            SqlCommand cmd = new SqlCommand("insert into MilestonePackage values('" + guid + "', '" + DateTime.Now.ToString() + "', '" + txtPackageName.Value + "')", c, trans);
            cmd.ExecuteNonQuery();

            
            lblMsgTemplateName.Text = "Data saved";
            txtPackageName.Value = "";

            
            trans.Commit();

            BindRepeater1();

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

    private void BindRepeater1()
    {


        String all33 = "SELECT * FROM MilestonePackage";
        SqlCommand cmd33 = new SqlCommand(all33, c);
        SqlDataAdapter da33 = new SqlDataAdapter(cmd33);
        DataTable dt33 = new DataTable();
        da33.Fill(dt33);
        r5.DataSource = dt33;
        r5.DataBind();




        SqlDataAdapter adp = new SqlDataAdapter("Select * from MilestonePackage", c);
        DataSet ds = new DataSet();
        adp.Fill(ds);

        ddlMilestone.DataSource = ds;
        ddlMilestone.DataTextField = "PackageName";
        ddlMilestone.DataValueField = "Id";
        ddlMilestone.DataBind();
        ddlMilestone.Items.Insert(0, new ListItem("--Select Milestone Package--", ""));

        ddlShowMilestone.DataSource = ds;
        ddlShowMilestone.DataTextField = "PackageName";
        ddlShowMilestone.DataValueField = "Id";
        ddlShowMilestone.DataBind();
        ddlShowMilestone.Items.Insert(0, new ListItem("--Select Milestone Package--", ""));
    }


    protected void ddlShowMilestone_TextChanged(object sender, EventArgs e)
    {
        BindRepeater();

    }


    protected void Order_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from MilestonePackageItems where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater();
        }
    }


    protected void r5_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            if (c.State == ConnectionState.Closed)
            {
                c.Open();
            }
            SqlCommand cmd = new SqlCommand("delete from MilestonePackage where Id = @Id", c);
            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            BindRepeater1();
        }
    }
}