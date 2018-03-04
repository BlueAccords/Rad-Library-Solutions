<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="SearchPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Homepage.aspx" Font-Underline="False">Home Page</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminPage.aspx" Font-Underline="False">Administrators</asp:HyperLink>
         &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/SearchPage.aspx" Font-Underline="True">Search Page</asp:HyperLink>
        <div>
            Search Page</div>
        <p>
            Search Books:
            <asp:TextBox ID="searchBooks_TextBox" runat="server"></asp:TextBox>
            <asp:Button ID="searchBooks_Btn" runat="server" Text="Submit" OnClick="searchBooksBtn_Click" />
        </p>
        <asp:GridView ID="searchBooks_GridView" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </form>
</body>
</html>
