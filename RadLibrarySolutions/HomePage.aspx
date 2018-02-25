<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        a {
            text-decoration: none;
        }
        .auto-style1 {
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Homepage.aspx" Font-Underline="True">Home Page</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminPage.aspx" Font-Underline="False">Administrators</asp:HyperLink>
            <br />
            <span class="auto-style1">Books currenly checked out by a User:</span><br />
            Select a User:
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Email" DataValueField="UserID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [USER]"></asp:SqlDataSource>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN" DataSourceID="QueryBonusGridView" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="CheckoutDate" HeaderText="CheckoutDate" SortExpression="CheckoutDate" />
                <asp:BoundField DataField="Due Date" HeaderText="Due Date" SortExpression="Due Date" />
                <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="QueryBonusGridView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [USER].Fname AS [First Name], [USER].Lname AS [Last Name], [USER].Email, CHECKOUT.CheckoutDate, CHECKOUT.DueDate AS [Due Date], CHECKOUT.ReturnDate, BOOK.BookISBN AS ISBN, BOOK.Title FROM [USER] INNER JOIN CHECKOUT ON [USER].UserID = CHECKOUT.UserID INNER JOIN BOOK_COPY ON CHECKOUT.CopyID = BOOK_COPY.CopyID INNER JOIN BOOK ON BOOK_COPY.BookBookISBN = BOOK.BookISBN WHERE ([USER].UserID = @UserID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <span class="auto-style1">Books currently available to be checked out:</span><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Query1_AvailableBooks" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="BookISBN" HeaderText="BookISBN" SortExpression="BookISBN" />
                <asp:BoundField DataField="CopyID" HeaderText="CopyID" SortExpression="CopyID" />
                <asp:BoundField DataField="DewyDecimalNum" HeaderText="DewyDecimalNum" SortExpression="DewyDecimalNum" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="Query1_AvailableBooks" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Book.Title, BOOK.BookISBN, Book_Copy.CopyID, DewyDecimalNum, BOOK_ON_HOLD.Status
FROM BOOK JOIN BOOK_COPY ON BOOK.BookISBN = BOOK_COPY.BookBookISBN 
JOIN BOOK_ON_HOLD ON BOOK_ON_HOLD.BookCopyID = BOOK_COPY.CopyID
WHERE BOOK_ON_HOLD.Status = 'READY';
"></asp:SqlDataSource>
        <br />
        <span class="auto-style1">Books currently available to be checked out by publisher:</span><p>
            Select a Publisher:
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="Query7_BooksOfPublisherDropdown" DataTextField="Publisher" DataValueField="Publisher">
            </asp:DropDownList>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CopyID" DataSourceID="Query7_BooksOfPublisherGridView" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="CopyID" HeaderText="CopyID" ReadOnly="True" SortExpression="CopyID" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="Query7_BooksOfPublisherGridView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BOOK.Title, Book_COPY.CopyID
FROM BOOK JOIN BOOK_COPY ON BOOK_COPY.BookBookISBN=BOOK.BookISBN
WHERE BOOK_COPY.CopyID NOT IN (SELECT CHECKOUT.CopyID
                               FROM CHECKOUT
                               WHERE ReturnDate IS NULL)
AND BOOK.Publisher = @Publisher
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="Publisher" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="Query7_BooksOfPublisherDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [BOOK]"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
