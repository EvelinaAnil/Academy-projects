<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP_1.Views.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newButtonStyle {
            background-color: #00FF21;
            font-size: large;
            color: #800080;
            text-decoration: underline;
        }
        .newStyle1 {
            border-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label1" runat="server" Text="Text"/>
        </p>

        <br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />

        <p>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Color" OnCheckedChanged="CheckBox1_CheckedChanged" />
            <%-- EnableViewState="False" AutoPostBack="true"--%>
        </p>
        
        <br />
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Name1" />
                <asp:ListItem Text="Name2" />
            </asp:DropDownList>
        </p>

        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" OnClientClick="return clientClick()" CssClass="newButtonStyle newStyle1" />
        </div>
        <br />
        <div>
            <input id="ButtonHtml" runat="server" type="button" value="buttonHtml" onclick="myFunction()" />
        </div>       
    </form>
    <script>
        function clientClick() {
            alert('clientClick!');
            //if (...) {
            //    return false;
            //}
        }
        function myFunction() {
            alert('Hello html!');
        }
    </script>
</body>
</html>
