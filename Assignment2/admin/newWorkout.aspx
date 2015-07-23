<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="newWorkout.aspx.cs" Inherits="Assignment2.newWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Add Workout: </h1>
    <fieldset>
         <label for="txtGroup" class="col-sm-2">Muscle Group:</label>
        <asp:DropDownList runat="server">
            <asp:ListItem>Biceps</asp:ListItem>
            <asp:ListItem>Triceps</asp:ListItem>
            <asp:ListItem>Deltoids</asp:ListItem>
            <asp:ListItem>Abs</asp:ListItem>
            <asp:ListItem>Quadriceps</asp:ListItem>
            <asp:ListItem>Trapezius</asp:ListItem>
            <asp:ListItem>Hamstring</asp:ListItem>
            <asp:ListItem>Calves</asp:ListItem>
            <asp:ListItem>Pectoral</asp:ListItem>
            <asp:ListItem>Upper Back</asp:ListItem>
            <asp:ListItem>Lower Back</asp:ListItem>
        </asp:DropDownList>
    </fieldset>
     <fieldset>
        <label for="txtExcercise" class="col-sm-2">Excercise:</label><asp:TextBox ID="txtExcercise" runat="server" required MaxLength="50"/>
        </fieldset>
 <fieldset>
         <label for="txtSets" class="col-sm-2"># of Sets:</label>
        <asp:DropDownList ID="ddlSets" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSets_SelectedIndexChanged">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
    </fieldset>
            <fieldset runat="server" visible="false">
                <label for="txtWeightSet1">Weight for Set 1: </label><asp:TextBox ID="txtWeightSet1" runat="server" TextMode="Number" />
                </fieldset>
            <fieldset runat="server" visible="false">
                <label for="txtRepsSet1">Reps for Set 1:</label><asp:TextBox ID="txtRepsSet1" runat="server" TextMode="Number" />
            </fieldset>
            <fieldset runat="server" visible="false">
                <label for="txtWeightSet2">Weight for Set 2: </label><asp:TextBox ID="txtWeightSet2" runat="server" TextMode="Number" />
            </fieldset>
            <fieldset runat="server" visible="false">
                <label for="txtRepsSet1">Reps for Set 2:</label><asp:TextBox ID="txtRepsSet2" runat="server" TextMode="Number" />
            </fieldset>

            <br />
            <fieldset>
        <label for="txtDate"class="col-sm-2">Date Of Workout:</label><asp:TextBox ID="txtDate" runat="server" />
        </fieldset>
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
</asp:Content>
