<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Application2.aspx.cs" Inherits="WebASP_3.Views.Application2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" />
        </div>
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Views/Application1.aspx">Application1</asp:HyperLink>
        </div>
    </form>
</body>
</html>
