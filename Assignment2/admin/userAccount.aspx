<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userAccount.aspx.cs" Inherits="Assignment2.userAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type='text/css'>
        body { background-image: url(/images/background4.jpg); background-size:cover; background-repeat:repeat }
    </style>
        <div class="row">
        <div class="col-lg-6 well col-lg-offset-3">
    <h1>My Account: </h1>
     <fieldset>
        <label for="txtUsername" class="col-sm-6 col-lg-offset-1" style="margin-top:20px;">Username:</label>
         <asp:TextBox style="margin-top:20px; color:black;" ID="txtUsername" runat="server" required="true" MaxLength="50" ReadOnly="True" Enabled="false" />
             <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="txtUsername"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 

        </fieldset>
            <fieldset>
            <label for="txtOldPW" class="col-sm-6 col-lg-offset-1" style="margin-top:20px;">Old Password(leave blank if not changing password): </label>
                <asp:TextBox style="margin-top:20px;" ID="txtOldPW" TextMode="Password" runat="server" MaxLength="50"/>
                <asp:RequiredFieldValidator id="RequiredFieldValidator1"
                    ControlToValidate="txtOldPW"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
        </fieldset>
        <fieldset>
            <label for="txtPW" class="col-sm-6 col-lg-offset-1" style="margin-top:20px;">New Password(leave blank if not changing password): </label>
            <asp:TextBox style="margin-top:20px;" ID="txtPassword" TextMode="Password" runat="server" MaxLength="50"/>
        </fieldset>
            <fieldset>
            <label for="txtPWConf" class="col-sm-6 col-lg-offset-1" style="margin-top:20px;">Confirm New Password(leave blank if not changing password): </label>
                <asp:TextBox style="margin-top:20px;" ID="txtPasswordConfirm" TextMode="Password" runat="server" MaxLength="50"/>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
     ControlToValidate="txtPassword"
     ControlToCompare="txtPasswordConfirm"
     ErrorMessage="No Match" 
     ToolTip="Password must be the same"
          CssClass="label label-danger" />
        </fieldset>
      
                        <div class="col-md-12 text-center"> 
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" style="margin-top:20px;"/>
                            <asp:Label ID="passwordChangedFlag" Visible="false" runat="server" CssClass="text-success">SUCCESS!</asp:Label>
            </div>
            
        </div>

        </div>
</asp:Content>
