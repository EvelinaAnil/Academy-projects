<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebASP_2.Views.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr style="text-align: center">
                    <td>Text </td>
                    <td>HyperLink </td>
                    <td>LinkButton </td>
                </tr>
                <tr>
                    <td>
                        <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Circle">
                            <asp:ListItem>One</asp:ListItem>
                            <asp:ListItem>Two</asp:ListItem>
                            <asp:ListItem>Three</asp:ListItem>
                        </asp:BulletedList>
                    </td>
                    <td>
                        <asp:BulletedList ID="BulletedList2" runat="server" BulletStyle="LowerAlpha" DisplayMode="HyperLink">
                            <asp:ListItem Value="1.html" />
                            <asp:ListItem Value="2.html" />
                            <asp:ListItem Value="3.html" />
                        </asp:BulletedList>
                    </td>
                    <td>
                        <asp:BulletedList ID="BulletedList3" runat="server" BulletStyle="LowerRoman" DisplayMode="LinkButton" OnClick="BulletedList3_Click">
                            <asp:ListItem Text="Red" Value="Pink" />
                            <asp:ListItem Text="Green" Value="YellowGreen" />
                            <asp:ListItem Text="Blue" Value="AliceBlue" />
                        </asp:BulletedList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
