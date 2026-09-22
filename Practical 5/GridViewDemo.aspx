<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = new[]
            {
                new { ID = 1, Name = "Jainish", Course = "B.Tech", Marks = 86 },
                new { ID = 2, Name = "Rahul", Course = "B.Tech", Marks = 78 },
                new { ID = 3, Name = "Priya", Course = "BCA", Marks = 91 },
                new { ID = 4, Name = "Amit", Course = "BCA", Marks = 74 }
            };
            GridView1.DataBind();
        }
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>GridView Demo</title>
</head>
<body>
<form id="form1" runat="server">
<div class="box">
    <h1>GridView Demo</h1>
    <p>GridView displays tabular data in rows and columns.</p>

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="true"
        CssClass="grid"
        BorderWidth="1"
        GridLines="Both">
    </asp:GridView>

    <br />
    <a href="Default.aspx">← Back to Home</a>
</div>
</form>
</body>
</html>
