<div></div>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="WebASP_1.Views.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div>
            <input id="Button1" runat="server" type="button" value="button" />
        </div>--%>

        <p>
           <asp:Label ID="Label1" runat="server" Text="Label"/>
        </p>

        <p>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Color" 
                 OnCheckedChanged="CheckBox1_CheckedChanged" />
           <%-- EnableViewState="false" AutoPostBack="true"--%>
        </p>

        <div>
                <asp:Button ID="Button1" runat="server" Text="Button"
                AutoPostBAck="true" OnClick="Button1_Click" OnClientClick="<%--return --%>clientClick()"/>
        </div>
        <br />
         <div>
                <input id="ButtonHTML" runat="server" type="button" value="buttonhtml"
                    onclick="myFunction()"/>
        </div>
    </form>

    <script> 
        function clientClick() {
            alert('clientClick!');
            //if (true) {
            //    return false;
            //}
        }

        function myFunction() {
            alert('Hello html!');
        }
    </script>

</body>
</html>
