<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="newFoodLog.aspx.cs" Inherits="Assignment2.newFoodLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type='text/css'>
        body { background-image: url(/images/background3.jpg); background-size:cover; background-repeat: no-repeat;}
    </style>
    
    <div class="row">
        <div class="col-lg-6 well col-lg-offset-3">
            <h1>Add Log: </h1>
            <div class="col-lg-offset-3">
     <fieldset>
        <label for="txtProtein" class="col-sm-4" style="margin-top:20px;">Protein (g):</label><asp:TextBox style="margin-top:20px;" ID="txtProtein" runat="server" required MaxLength="50"/>
         <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="txtProtein"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                   ControlToValidate="txtProtein"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
        </fieldset>
     <fieldset>
        <label for="txtCarbs" class="col-sm-4" style="margin-top:20px;">Carbs (g):</label><asp:TextBox style="margin-top:20px;" ID="txtCarbs" runat="server" required MaxLength="50" />
         <asp:RequiredFieldValidator id="RequiredFieldValidator1"
                    ControlToValidate="txtCarbs"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator2"
                   ControlToValidate="txtCarbs"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
        </fieldset>
        <fieldset>
        <label for="txtFat"class="col-sm-4" style="margin-top:20px;">Fat (g):</label><asp:TextBox style="margin-top:20px;" ID="txtFat" runat="server" required MaxLength="50" />
            <asp:RequiredFieldValidator id="RequiredFieldValidator3"
                    ControlToValidate="txtFat"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator3"
                   ControlToValidate="txtFat"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
        </fieldset>
            <fieldset>
        <label for="txtCalories"class="col-sm-4" style="margin-top:20px;">Calories:</label><asp:TextBox style="margin-top:20px;" ID="txtCalories" runat="server" required MaxLength="50" />
                <asp:RequiredFieldValidator id="RequiredFieldValidator4"
                    ControlToValidate="txtCalories"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator4"
                   ControlToValidate="txtCalories"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
        </fieldset>
            <fieldset>
        <label for="txtDate"class="col-sm-4" style="margin-top:20px;">Date Of Meal: (yyy-mm-dd)</label><asp:TextBox style="margin-top:20px;" ID="txtDate" runat="server" />
                <asp:RequiredFieldValidator id="RequiredFieldValidator5"
                    ControlToValidate="txtDate"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
                <asp:RangeValidator ID="rvld2" runat="server" ErrorMessage="Must be a valid date" ControlToValidate="txtDate" 
                    CssClass="label label-danger" Type="Date" MinimumValue="2000-01-01" MaximumValue="2999-01-01"></asp:RangeValidator>

        </fieldset></div>
            <div class="col-md-12 text-center"> 
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" style="margin-top:20px;"/>
            </div></div></div>
 

</asp:Content>
