<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Session.aspx.cs" Inherits="WebASP_3.Views.Session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"/>
            <asp:Button ID="Submit" runat="server" Text="Submit" />
            <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
            <asp:Button ID="Abandon" runat="server" Text="Abandon" OnClick="Abandon_Click" />
        </div>
    </form>
</body>
</html>
