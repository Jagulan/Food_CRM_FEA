using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

public class ConnectionString
{
    public static SqlConnection getConnection()
    {
        SqlConnection c = new SqlConnection("Data Source=DESKTOP-M0L170T; Initial Catalog=FEA_DB; User Id=sa; Password=Abc@123");
        return c;
    }
}