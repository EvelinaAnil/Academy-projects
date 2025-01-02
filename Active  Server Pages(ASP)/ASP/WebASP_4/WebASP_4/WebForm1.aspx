<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP_4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Last name: "/>
            <asp:TextBox ID="TextBox1" runat="server"/> <asp:Label ID="LastLabel" runat="server" ForeColor="Red" Text="*"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <br />

        <div>
            <asp:Label ID="Label2" runat="server" Text="E-mail: "/>
            <asp:TextBox ID="TextBox2" runat="server"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
        </div>
        <br />

        <div>
            <asp:Label ID="Label3" runat="server" Text="Age: "/>
            <asp:TextBox ID="TextBox3" runat="server"/>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" ControlToValidate="TextBox3" MinimumValue="18" MaximumValue="70" Type="Integer"/>
        </div>
        <br />

        <div>
            <asp:Label ID="Label4" runat="server" Text="Password: " />
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" />
        </div>

        <div>
            <asp:Label ID="Label5" runat="server" Text="Confirm: " />
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="TextBox4" ControlToCompare="TextBox5" Operator="Equal">
                <%--CompareError--%>
                <img src="warning.png" />
            </asp:CompareValidator>
        </div>
        <br />

        <div>
            <asp:Label ID="Label6" runat="server" Text="Even number only: "/>
            <asp:TextBox ID="TextBox6" runat="server"/>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ControlToValidate="TextBox6" ClientValidationFunction="ValidateEvenNumber" OnServerValidate="CustomValidator1_ServerValidate" />
        </div>
        <br />
        
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Magenta" ShowMessageBox="false" HeaderText="Error on page:" DisplayMode="BulletList" ShowSummary="true" />
        </div>


        <div>
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
        </div>
        <br />

        <div>
            Search <asp:TextBox ID="TextBox7" runat="server"/>
            <asp:Button ID="Button2" runat="server" Text="Search" ValidationGroup="1" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox7" ErrorMessage="Search is empty" ForeColor="Red" ValidationGroup="1" />
        </div>
        <br />
        <br />
        <div>
            User name <asp:TextBox ID="TextBox8" runat="server"/>
            <asp:Button ID="Button3" runat="server" Text="Register" ValidationGroup="qwe" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox8" ErrorMessage="User name is empty" ForeColor="Red" ValidationGroup="qwe" />
        </div>

    </form>
    <script>
        function ValidateEvenNumber(obj, arg) {
            let num = parseInt(arg.Value);
            arg.IsValid = num % 2 == 0;
        }
    </script>
</body>
</html>
