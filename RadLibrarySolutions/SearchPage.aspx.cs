using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SearchPage : System.Web.UI.Page
{

    OleDbConnection DBConnection;
    OleDbCommand DBCommand;
    OleDbDataReader DBReader;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string selectUSERSQL;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void searchBooksBtn_Click(object sender, EventArgs e)
    {

        //selectUSERSQL = ("SELECT Fname, Lname, Email FROM [User] WHERE Fname LIKE \'%" + (searchBooks_TextBox.Text + "%\' "));
        //selectUSERSQL = "SELECT * FROM [User]";
        selectUSERSQL = ("SELECT [USER].Fname, [USER].Lname, [USER].Email, BOOK.Title, CHECKOUT.CheckoutDate, CHECKOUT.DueDate, CHECKOUT.ReturnDate" +
                        " FROM CHECKOUT, BOOK_COPY, BOOK, [USER]" +
                        " WHERE ReturnDate IS NULL" +
                        " AND BOOK_COPY.CopyID = CHECKOUT.CopyID" +
                        " AND BOOK_COPY.BookBookISBN = BOOK.BookISBN" +
                        " AND[USER].UserID = CHECKOUT.UserID" +
                        " AND[USER].Fname LIKE \'%" + (searchBooks_TextBox.Text + "%\' "));
        SqlCommand comm = new SqlCommand(selectUSERSQL, con);

        con.Open();
        comm.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = comm;

        DataSet ds = new DataSet();
        da.Fill(ds, "[USER].Fname");
        da.Fill(ds, "[USER].Lname");
        da.Fill(ds, "[USER].Email");
        da.Fill(ds, "BOOK.Title");
        da.Fill(ds, "CHECKOUT.CheckoutDate");
        da.Fill(ds, "CHECKOUT.DueDate");
        da.Fill(ds, "CHECKOUT.ReturnDate");


        searchBooks_GridView.DataSource = ds;
        searchBooks_GridView.DataBind();

        con.Close();
    }
}