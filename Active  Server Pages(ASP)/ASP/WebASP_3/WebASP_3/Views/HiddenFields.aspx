<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HiddenFields.aspx.cs" Inherits="WebASP_3.Views.HiddenFields" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <h1>Hidden fields</h1>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
            <asp:HiddenField ID="beginTime" runat="server" />
            <asp:HiddenField ID="countRequest" runat="server" />
        </div>
    </form>
</body>
</html>
