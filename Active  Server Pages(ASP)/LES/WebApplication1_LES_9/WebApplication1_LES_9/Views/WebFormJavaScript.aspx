﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormJavaScript.aspx.cs" Inherits="WebApplication1_LES_9.Views.WebFormJavaScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"/>
        </div>
        <br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button"  OnClientClick="return confirm('Post back on the server?');" />
        </div><%--OnClientClick="javaScriptTest()"--%>
    </form>
</body>
<script>
    function javaScriptTest() {
        alert('Hello');
        // ...
        return false;
    }
</script>
</html>
