<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SourceQueryString.aspx.cs" Inherits="WebASP_3.Views.SourceQueryString" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <h1 style="color: Red">Введіть обліковий запис</h1>
            <table border="0" style="display:inline-block; margin:auto">
                <tr>
                    <td style="text-align: right; width: 180px;">&nbsp;<asp:Label ID="Label1" runat="server" Text="Ім'я:" />
                    </td>
                    <td>&nbsp;<asp:TextBox ID="Name" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 180px; text-align: right">&nbsp;<asp:Label ID="Label2" runat="server" Text="Пароль:" />
                    </td>
                    <td>&nbsp;<asp:TextBox ID="Password" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">&nbsp;<asp:Button ID="Button1" runat="server" Text="Відправити" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
