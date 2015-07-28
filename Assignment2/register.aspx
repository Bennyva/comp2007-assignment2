<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Assignment2.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type='text/css'>
        body { background-image: url(images/background.jpg); background-size:cover; background-repeat: no-repeat; color:white;}
    </style>
        <div class="row" style="min-height: 80%; min-height: 80vh; display: flex; align-items: center;">
        <div class="col-md-6 col-md-offset-5">
    <h1>Register</h1>
    <h5>All fields are required</h5>

    <div class="form-group-lg">
        <asp:label id="lblStatus" runat="server" cssclass="label label-danger" />
    </div>
    <div class="form-group">
        <label for="txtUsername" class="col-sm-2">Username:</label>
        <asp:textbox id="txtUsername" runat="server" style="color:black;" />
            <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="txtUsername"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    </div>
    <div class="form-group">
        <label for="txtPassword" class="col-sm-2">Password:</label>
        <asp:textbox id="txtPassword" runat="server" textmode="password" style="color:black;" />
            <asp:RequiredFieldValidator id="RequiredFieldValidator1"
                    ControlToValidate="txtPassword"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    </div>
    <div class="form-group">
        <label for="txtConfirm" class="col-sm-2">Confirm:</label>
        <asp:textbox id="txtConfirm" runat="server" textmode="password" style="color:black;"/>
        <asp:comparevalidator runat="server" operator="Equal" controltovalidate="txtPassword"
            controltocompare="txtConfirm" cssclass="label label-danger" errormessage="Passwords must match" />
            <asp:RequiredFieldValidator id="RequiredFieldValidator3"
                    ControlToValidate="txtConfirm"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    </div>
    <div class="col-sm-offset-2">
        <asp:button id="btnRegister" runat="server" text="Register" cssclass="btn btn-primary" 
            OnClick="btnRegister_Click" />
    </div>
            </div>
            </div>

</asp:Content>
