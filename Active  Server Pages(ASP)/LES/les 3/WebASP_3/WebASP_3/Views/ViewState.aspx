<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState.aspx.cs" Inherits="WebASP_3.Views.ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <h1 style="color:red">Do anket</h1>
            <table id="Table1" runat="server" style="text-align:left; width:500px;
            border-width:medium; text-align:center"   >
                <tr>
                    <td style="width:200px">Name of subject</td>
                     <td> <b>Do</b> </td>
                </tr>
                <tr>
                    <td style="width:200px">Name</td>
                     <td> <asp:TextBox ID="TextBox1" runat="server" /> </td>
                </tr>
                <tr>
                    <td style="width:200px"> <b>Nummer:</b> </td>
                     <td> <asp:TextBox ID="TextBox2" runat="server" /> </td>
                </tr>
                 <tr>
                    <td style="width:200px"> <b>Years:</b> </td>
                     <td> <asp:TextBox ID="TextBox3" runat="server" /> </td>
                </tr>
                 <tr>
                    <td style="width:200px"> <b>E-mail:</b> </td>
                     <td> <asp:TextBox ID="TextBox4" runat="server" /> </td>
                </tr>
                 <tr>
                    <td style="width:200px"> <b>Password:</b> </td>
                     <td> <asp:TextBox ID="TextBox5" runat="server" /> </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRestore" Text="Reload" runat="server" OnClick="btnRestore_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
