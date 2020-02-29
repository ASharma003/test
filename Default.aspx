<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="testWebsite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h3>Login Details</h3>

        <asp:Label ID="lblEmpID" runat="server" AssociatedControlID="txtEmpID">Employee ID: &nbsp;</asp:Label>
        <asp:TextBox ID="txtEmpID" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmpID" Display="Dynamic" CssClass="text-danger" ErrorMessage="Enter Employee ID"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmpID" runat="server" SetFocusOnError="true"
            ErrorMessage="Only Numbers allowed" CssClass="text-danger" Display="Dynamic" ValidationExpression="\d+">
        </asp:RegularExpressionValidator>

        <asp:Label ID="lblEmpEmail" runat="server" AssociatedControlID="txtEmpEmail">Email ID: &nbsp;</asp:Label>
        <asp:TextBox ID="txtEmpEmail" runat="server" Width="250px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmpEmail" Display="Dynamic" CssClass="text-danger" ErrorMessage="Enter Email ID"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmpEmail" Display="Dynamic" CssClass="text-danger"
            SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>

        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="150px" class="btn btn-primary"  CausesValidation="true" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="true" CssClass="text-danger" Visible="false"></asp:Label> 



        <%--<p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <%--<div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
