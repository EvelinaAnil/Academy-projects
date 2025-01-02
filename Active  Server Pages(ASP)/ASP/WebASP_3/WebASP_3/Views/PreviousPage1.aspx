<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviousPage1.aspx.cs" Inherits="WebASP_3.Views.PreviousPage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Button" PostBackUrl="~/Views/PreviousPage2.aspx" />
        </div>
    </form>
</body>
</html>
