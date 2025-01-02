<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewState.aspx.cs" Inherits="WebASP_3.Views.ViewState" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center">
            <h1 style="color:red">Заповніть анкету</h1>

            <table id="Table1" runat="server" style="text-align: left; width: 500px; border-width: medium" align="center">
                <tr>
                    <td style="width: 200px"><b>Найменування</b></td>
                    <td><b>Значення</b></td>
                </tr>
                <tr>
                    <td style="width: 200px"><b>Ім'я:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px"><b>Обліковий номер:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px"><b>Вік:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px"><b>E-mail:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px"><b>Пароль:</b></td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"/>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Відправити" OnClick="btnSubmit_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" Text="Зберегти" OnClick="btnSave_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRestore" runat="server" Text="Відновити" OnClick="btnRestore_Click" />
        </div>
    </form>
</body>
</html>
