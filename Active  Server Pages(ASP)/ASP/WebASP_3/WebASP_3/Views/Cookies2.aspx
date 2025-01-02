<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookies2.aspx.cs" Inherits="WebASP_3.Views.Cookies2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1 style="color:red">Cookies test</h1>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" />
        </div>
        <div>
            <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Restore" runat="server" Text="Restore" OnClick="Restore_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" />
        </div>
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Views/Cookies1.aspx">CookiesPage1</asp:HyperLink>
        </div>
    </form>
</body>
</html>
