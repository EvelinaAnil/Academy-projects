<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCallbackDB.aspx.cs" Inherits="WebApplication1_LES_9.Views.WebFormCallbackDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="sourceAuthors" runat="server"
 ConnectionString="<%$ connectionString:library %>" SelectCommand="SELECT * FROM Authors;" /> 
            
         <div>
              <asp:DropDownList ID="dropDownLIstAuthors" runat="server"
 DataSourceID="sourceAuthors" DataTextField="LastName" DataValueField="Id" />
             &nbsp;&nbsp;&nbsp;
             <asp:ListBox ID="ListBoxBooks" runat="server" Width="400"/>
         </div>
    </form>
</body>
<script>
    function clientCallback(result) {
        document.getElementById('listBoxBooks')
    }
</script>
</html>
