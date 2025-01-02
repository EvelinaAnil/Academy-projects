<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCallback.aspx.cs" Inherits="WebApplication1_LES_9.Views.WebFormCallback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="<%# DateTime.Now.ToString() %>" />
            &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Postback" />
        </div>
        <br />
        Callback example
        <div>
            <input id="btnDateTime" runat="server" type="button" value="DateTime" />
            &nbsp;&nbsp;
            <asp:Label ID="lblDateTime" runat="server"></asp:Label>
        </div>
         <br />
        <div>
            <asp:ListBox ID="ListBoxSubjects" runat="server"/>
            <br />
            <input id="btnRating" runat="server" type="button" value="Rating" />
            &nbsp;&nbsp;
            <asp:TextBox ID="tbRating" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
<script>
    function schowDate(response) {
        document.getElementById("lblDateTime").innerHTML = response;
        document.getElementById("ListBoxSubjects").value = response;
    }
    function schowRating(response) {
        document.forms[0].tbRating.value = response;
    }
</script>
</html>
