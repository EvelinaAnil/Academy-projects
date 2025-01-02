<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP_2.Views.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <hr />

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />

        <div>
            <asp:ListBox ID="ListBox1" runat="server" Width="120px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
                <asp:ListItem Text="Orange color" Value="Orange" />
                <asp:ListItem Text="Green color" Value="LightGreen" />
                <asp:ListItem Text="Blue color" Value="LightBlue" />
            </asp:ListBox>
        </div>
        <br />

        <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
            <asp:ListItem Text="Orange color" Value="Orange" />
            <asp:ListItem Text="Green color" Value="LightGreen" />
            <asp:ListItem Text="Blue color" Value="LightBlue" />
        </asp:CheckBoxList>
        <br />

        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Text="Orange color" Value="Orange" />
            <asp:ListItem Text="Green color" Value="LightGreen" />
            <asp:ListItem Text="Blue color" Value="LightBlue" />
        </asp:RadioButtonList>
        <br />

        <div>
            <asp:RadioButton ID="RadioButton1" runat="server" Text="C#" GroupName="#1" />
            <br />
            <asp:RadioButton ID="RadioButton2" runat="server" Text="Java" GroupName="#1" />
            <br />
            <asp:RadioButton ID="RadioButton3" runat="server" Text="C++" GroupName="#2" />
            <br />
        </div>

        <div>
            <asp:Image ID="Image1" runat="server" ImageAlign="Top" AlternateText="Apollo" Height="70px" Width="60px" /><%-- ImageUrl="~/Images/Apollo.jpg"--%>
            <%--<img src="../Images/Apollo.jpg" />--%>
        </div>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
        <br />


        <asp:Label ID="Label2" runat="server"/>
        <br />
        <asp:Calendar ID="Calendar1" runat="server" BorderStyle="Ridge" BorderWidth="2px" DayStyle-BorderStyle="Double" TodayDayStyle-BackColor="#00CC66" OnSelectionChanged="Calendar1_SelectionChanged"/>
        <br />

        <asp:Label ID="Label3" runat="server"/>
        <br />
        <asp:Calendar ID="Calendar2" runat="server" SelectionMode="DayWeekMonth" TitleFormat="Month" OnSelectionChanged="Calendar2_SelectionChanged" OnDayRender="Calendar2_DayRender">
            <TodayDayStyle BorderColor="Lime" BorderStyle="Solid" BorderWidth="2px" />
            <WeekendDayStyle Font-Bold="true" ForeColor="Red" />
        </asp:Calendar>
        <br />

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Go to WebForm2</asp:LinkButton>
        <br />
        <br />

        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Views/WebForm2.aspx">Go to WebForm2</asp:LinkButton>
        <br />
        <br />

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Views/WebForm2.aspx">WebForm2</asp:HyperLink>

    </form>
</body>
</html>
