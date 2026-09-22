<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataList1.DataSource = new[]
            {
                new { Name = "Laptop", Price = "₹55,000", Category = "Electronics" },
                new { Name = "Smartphone", Price = "₹25,000", Category = "Electronics" },
                new { Name = "Keyboard", Price = "₹1,500", Category = "Accessories" },
                new { Name = "Headphones", Price = "₹2,500", Category = "Accessories" }
            };
            DataList1.DataBind();
        }
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>DataList Demo</title>
</head>
<body>
<form id="form1" runat="server">
<div class="box">
    <h1>DataList Demo</h1>
    <p>DataList displays repeated records using a customizable template.</p>

    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <div class="product">
                <h3><%# Eval("Name") %></h3>
                <p><b>Category:</b> <%# Eval("Category") %></p>
                <p><b>Price:</b> <%# Eval("Price") %></p>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <br />
    <a href="Default.aspx">← Back to Home</a>
</div>
</form>
</body>
</html>
