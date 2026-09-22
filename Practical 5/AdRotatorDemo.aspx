<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>AdRotator Demo</title>
</head>
<body>
<form id="form1" runat="server">
<div class="box">
    <h1>AdRotator Demo</h1>
    <p>The advertisement changes randomly when the page is loaded/refreshed.</p>

    <div class="ad">
        <asp:AdRotator ID="AdRotator1" runat="server"
            AdvertisementFile="~/Advertisements.xml" />
    </div>

    <p><b>Advertisements configured:</b> 4</p>
    <p>Refresh the page to see another advertisement.</p>

    <a href="Default.aspx">← Back to Home</a>
</div>
</form>
</body>
</html>
