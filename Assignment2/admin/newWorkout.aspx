<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="newWorkout.aspx.cs" Inherits="Assignment2.newWorkout" %>
<%@ Reference Control="setsControl.ascx" %>
<%@ Register Src="/admin/setsControl.ascx" TagPrefix="setsControl" TagName="setsControl" %>
<%@ Register Src="~/admin/setsControl.ascx" TagPrefix="uc1" TagName="setsControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type='text/css'>
        body { background-image: url(/images/background2.jpg); background-size:cover; background-repeat: no-repeat; }
    </style>
    <div class="row">
        <div class="col-lg-10 well col-lg-offset-1">
        <h1>Add Workout: </h1>
    <fieldset>
         <label for="ddlGroup" class="col-sm-2">Muscle Group:</label>
        <asp:DropDownList runat="server" ID="ddlMuscleGroup" style="color:black">
            <asp:ListItem Value="Biceps">Biceps</asp:ListItem>
            <asp:ListItem Value="Triceps">Triceps</asp:ListItem>
            <asp:ListItem Value="Deltoids">Deltoids</asp:ListItem>
            <asp:ListItem Value="Abs">Abs</asp:ListItem>
            <asp:ListItem Value="Quadriceps">Quadriceps</asp:ListItem>
            <asp:ListItem Value="Trapezius">Trapezius</asp:ListItem>
            <asp:ListItem Value="Hamstring">Hamstring</asp:ListItem>
            <asp:ListItem Value="Calves">Calves</asp:ListItem>
            <asp:ListItem Value="Pectoral">Pectoral</asp:ListItem>
            <asp:ListItem Value="Upper Back">Upper Back</asp:ListItem>
            <asp:ListItem Value="Lower Back">Lower Back</asp:ListItem>
        </asp:DropDownList>
    </fieldset>
     <fieldset>
        <label for="txtExcercise" class="col-sm-2">Excercise:</label><asp:TextBox ID="txtExcercise" runat="server" required="true" MaxLength="50" style="color:black"/>
        </fieldset>
 <fieldset>
         <label for="txtSets" class="col-sm-2"># of Sets:</label>
        <asp:DropDownList ID="ddlSets" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSets_SelectedIndexChanged" style="color:black">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
    </fieldset>
            <fieldset>
        <uc1:setsControl runat="server" ID="setsControl1" /> 
        <uc1:setsControl runat="server" ID="setsControl2" visible="false"/> 
        <uc1:setsControl runat="server" ID="setsControl3" visible="false"/> 
        <uc1:setsControl runat="server" ID="setsControl4" visible="false"/> 
        <uc1:setsControl runat="server" ID="setsControl5" visible="false"/> 
            </fieldset>

            <br />
            <fieldset>
        <label for="txtDate"class="col-sm-2">Date Of Workout: (yyyy-mm-dd)</label><asp:TextBox ID="txtDate" runat="server" style="color:black" />
                <asp:RangeValidator ID="rvld1" runat="server" ErrorMessage="Must be a valid date" ControlToValidate="txtDate" 
                    CssClass="label label-danger" Type="Date" MinimumValue="2000-01-01" MaximumValue="2999-01-01"></asp:RangeValidator>
                <asp:RequiredFieldValidator id="RequiredFieldValidator5"
                    ControlToValidate="txtDate"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
        </fieldset>
            <div class="col-md-12 text-center"> 
    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/></div></div></div>
</asp:Content>
