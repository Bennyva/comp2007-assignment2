<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Assignment2.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type='text/css'>
        body { background-image: url(images/background.jpg); background-size:cover; background-repeat: no-repeat; color:white;}
    </style>
    <div class="row" style="min-height: 80%; min-height: 80vh; display: flex; align-items: center;">
        <div class="col-md-6 col-md-offset-5">
            <h1>Login</h1>
            <div class="form-group-lg">
                <asp:label id="lblStatus" runat="server" cssclass="label label-danger" />
            </div>
            <div class="form-group">
                <label for="txtUsername" class="col-sm-2">Username:</label>
                <asp:textbox id="txtUsername" runat="server" style="color:black;"/>
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
            <div class="col-sm-offset-2">
                <asp:button id="btnLogin" runat="server" text="Login" cssclass="btn btn-primary" 
                    OnClick="btnLogin_Click" />
            </div>
            </div>
     </div>
</asp:Content>
