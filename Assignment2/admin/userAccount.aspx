<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userAccount.aspx.cs" Inherits="Assignment2.userAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>My Account: </h1>
     <fieldset>
        <label for="txtUsername" class="col-sm-2">Username:</label><asp:TextBox ID="txtUsername" runat="server" required="true" MaxLength="50" ReadOnly="True" />
        </fieldset>
            <fieldset>
            <label for="txtOldPW" class="col-sm-2">Old Password(leave blank if not changing password): </label><asp:TextBox ID="txtOldPW" TextMode="Password" runat="server" MaxLength="50"/>
        </fieldset>
        <fieldset>
            <label for="txtPW" class="col-sm-2">New Password(leave blank if not changing password): </label><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" MaxLength="50"/>
        </fieldset>
            <fieldset>
            <label for="txtPWConf" class="col-sm-2">Confirm New Password(leave blank if not changing password): </label><asp:TextBox ID="txtPasswordConfirm" TextMode="Password" runat="server" MaxLength="50"/>
        </fieldset>
      <asp:CompareValidator ID="CompareValidator1" runat="server" 
     ControlToValidate="txtPassword"
     CssClass="ValidationError"
     ControlToCompare="txtPasswordConfirm"
     ErrorMessage="No Match" 
     ToolTip="Password must be the same" />
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
</asp:Content>
