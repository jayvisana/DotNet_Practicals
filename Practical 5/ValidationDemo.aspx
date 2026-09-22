<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblResult.Text = "Form submitted successfully!";
        }
        else
        {
            lblResult.Text = "";
        }
    }

    protected void cvName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = args.Value.Trim().Length >= 3;
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Validation Controls Demo</title>
    <style type="text/css">
        .auto-style1 {
            width: 170px;
        }
        .auto-style2 {
            width: 110px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
<div class="box">
    <h1>ASP.NET Validation Controls</h1>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
        CssClass="summary" HeaderText="Please correct the following errors:" />

    <table style="width: 100%; margin-right: 0px;">
        <tr>
            <td class="auto-style1">
        <label>Name:</label>&nbsp;

    </td>
            <td>
        <asp:TextBox ID="txtName" runat="server" />
        <asp:RequiredFieldValidator ID="rfvName0" runat="server"
            ControlToValidate="txtName" ErrorMessage="Name is required."
            CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvName0" runat="server"
            ControlToValidate="txtName" ErrorMessage="Name must contain at least 3 characters."
            CssClass="error" Display="Dynamic" OnServerValidate="cvName_ServerValidate">*</asp:CustomValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
        <label>Age:</label></td>
            <td>
        <asp:TextBox ID="txtAge" runat="server" />
        <asp:RequiredFieldValidator ID="rfvAge" runat="server"
            ControlToValidate="txtAge" ErrorMessage="Age is required."
            CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvAge" runat="server"
            ControlToValidate="txtAge" MinimumValue="18" MaximumValue="60"
            Type="Integer" ErrorMessage="Age must be between 18 and 60."
            CssClass="error" Display="Dynamic">*</asp:RangeValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">

    <div class="row">
        <label>Email:</label></div>

            </td>
            <td>
        <asp:TextBox ID="txtEmail" runat="server" />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
            ControlToValidate="txtEmail" ErrorMessage="Email is required."
            CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
            ErrorMessage="Enter a valid email address."
            CssClass="error" Display="Dynamic">*</asp:RegularExpressionValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
        <label>Password:</label></td>
            <td>&nbsp;<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
            ControlToValidate="txtPassword" ErrorMessage="Password is required."
            CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
        <label>Confirm Password:</label></td>
            <td>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        <asp:CompareValidator ID="compPassword" runat="server"
            ControlToValidate="txtConfirmPassword"
            ControlToCompare="txtPassword"
            ErrorMessage="Passwords do not match."
            CssClass="error" Display="Dynamic">*</asp:CompareValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
        <label>Course:</label></td>
            <td>
        <asp:DropDownList ID="ddlCourse" runat="server">
            <asp:ListItem Text="-- Select Course --" Value="" />
            <asp:ListItem Text="B.Tech" Value="B.Tech" />
            <asp:ListItem Text="BCA" Value="BCA" />
            <asp:ListItem Text="MCA" Value="MCA" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvCourse" runat="server"
            ControlToValidate="ddlCourse" InitialValue=""
            ErrorMessage="Please select a course."
            CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table style="width:100%;">
        <tr>
            <td class="auto-style2">

    <asp:Button ID="btnSubmit" runat="server" Text="Submit"
        CssClass="btn" OnClick="btnSubmit_Click" />

            </td>
            <td>

    <asp:Button ID="btnReset" runat="server" Text="Reset"
        CssClass="btn" CausesValidation="false"
        OnClientClick="this.form.reset(); return false;" />

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblResult" runat="server" Font-Bold="true" />

    <br /><br />
    <a href="Default.aspx">← Back to Homek to Home</a>
</div>
</form>
</body>
</html>


