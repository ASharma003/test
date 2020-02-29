<%@ Page Title="Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.vb" Inherits="testWebsite.Dashboards" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolKit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" language="javascript">

        function CheckDifference() {

            var today = new Date();
            var start = new Date(document.getElementById("<%=txtDate.ClientID %>").value);
            var end = new Date(document.getElementById("<%=txtDate2.ClientID %>").value);
            if (end > today) {
                alert("No future date allowed.");
                document.getElementById("<%=hflag.ClientID %>").value = "False";
            } else {
                var time_diff = end.getTime() - start.getTime();
                var Days_diff = (time_diff / (1000 * 3600 * 24)) + 1;
                if (Days_diff > 7) {
                    alert("Date range must not be greater than 7");
                    document.getElementById("<%=hflag.ClientID %>").value = "False";
                } else { document.getElementById("<%=hflag.ClientID %>").value = "True"; }
            }
        }
    </script>
    <asp:HiddenField ID="hflag" runat="server" Value="False" />
    <div>
        <h2>
            <center>Dashboard</center>
        </h2>
    </div>
    <div class="border">
        <div class="container">
            <div>&nbsp;</div>
            Dates Between: &nbsp;
            <asp:TextBox ID="txtDate" runat="server" Width="100px" MaxLength="1" Style="text-align: justify" ValidationGroup="MKE" />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Calendar.png" CausesValidation="False" TabIndex="-1" Width="25" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" Display="Dynamic" CssClass="text-danger" ErrorMessage="Select Start Date"></asp:RequiredFieldValidator>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender5" runat="server" TargetControlID="txtDate"
                Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError"
                MaskType="Date" DisplayMoney="Left" AcceptNegative="Left" ErrorTooltipEnabled="True" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" PopupButtonID="ImageButton1" Format="MM-dd-yyyy" />
            &nbsp; And &nbsp;
             <asp:TextBox ID="txtDate2" runat="server" Width="100px" MaxLength="1" Style="text-align: justify" ValidationGroup="MKE" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/Calendar.png" CausesValidation="False" TabIndex="-1" Width="25" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate2" Display="Dynamic" CssClass="text-danger" ErrorMessage="Select End Date"></asp:RequiredFieldValidator>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtDate2" Mask="99/99/9999"
                MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" MaskType="Date" DisplayMoney="Left" AcceptNegative="Left" ErrorTooltipEnabled="True" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDate2" PopupButtonID="ImageButton2" Format="MM-dd-yyyy" />
            &nbsp;
        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="150px" class="btn btn-primary" CausesValidation="true" OnClientClick="CheckDifference()" />
            <div>&nbsp;</div>
        </div>
    </div>
    <br />
    <div class="border">
        <div class="container">
            <div>&nbsp;</div>
            <asp:GridView ID="grid" runat="server"></asp:GridView>
            <div>&nbsp;</div>
        </div>
    </div>
</asp:Content>
