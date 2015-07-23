<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="newFoodLog.aspx.cs" Inherits="Assignment2.newFoodLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Meal: </h1>
     <fieldset>
        <label for="txtProtein" class="col-sm-2">Protein(in g):</label><asp:TextBox ID="txtProtein" runat="server" required MaxLength="50"/>
        </fieldset>
     <fieldset>
        <label for="txtCarbs" class="col-sm-2">Carbs(in g):</label><asp:TextBox ID="txtCarbs" runat="server" required MaxLength="50" />
        </fieldset>
        <fieldset>
        <label for="txtFat"class="col-sm-2">Fat(in g):</label><asp:TextBox ID="txtFat" runat="server" required MaxLength="50" />
        </fieldset>
            <fieldset>
        <label for="txtCalories"class="col-sm-2">Calories:</label><asp:TextBox ID="txtCalories" runat="server" required MaxLength="50" />
        </fieldset>
            <fieldset>
        <label for="txtDate"class="col-sm-2">Date Of Meal:</label><asp:TextBox ID="txtDate" runat="server" />
        </fieldset>
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
</asp:Content>
