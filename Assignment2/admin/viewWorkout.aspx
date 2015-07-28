<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewWorkout.aspx.cs" Inherits="Assignment2.viewWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type='text/css'>
        body { background-image: url(/images/background2.jpg); background-size:cover; background-repeat: no-repeat;}
    </style>
    <div class="row">
    <div class="col-lg-10 col-lg-offset-1">
        <h1>Workout Log </h1>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
             OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="7" Text="7" />
            <asp:ListItem Value="14" Text="14" />
            <asp:ListItem Value="999999" Text="All" />
        </asp:DropDownList>

         <asp:GridView ID="showWorkout" runat="server" AutoGenerateColumns="false" DataKeyNames="workoutLogID"
         CssClass="table table-striped table-hover" OnRowDeleting="showWorkout_RowDeleting"
         AllowPaging="true" PageSize="7" OnPageIndexChanging="showWorkout_PageIndexChanging"
         AllowSorting="true" OnSorting="showWorkout_Sorting" OnRowDataBound="showWorkout_RowDataBound">
        <Columns>
            <asp:BoundField DataField="muscleGroup" HeaderText="Muscle Group" SortExpression="MuscleGroup" />
            <asp:BoundField DataField="excercise" HeaderText="Excercise" SortExpression="excercise" />
            <asp:BoundField DataField="wSets" HeaderText="Sets" SortExpression="wSets" />
            <asp:BoundField DataField="wDate" HeaderText="Date" SortExpression="wDate" />
             <asp:HyperLinkField Text="Expand" NavigateUrl="viewWorkout.aspx" DataNavigateUrlFields="workoutLogID"
                 DataNavigateUrlFormatString="viewWorkout.aspx?workoutLogID={0}" HeaderText="Sets Info" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
    </div>
    </div>
    <div class="col-md-10 col-md-offset-1">
    <asp:GridView ID="showSetsLog" runat="server" AutoGenerateColumns="false" DataKeyNames="setID"
         CssClass="table table-striped table-hover" 
         
         AllowSorting="true" OnSorting="showWorkout_Sorting" OnRowDataBound="showWorkout_RowDataBound">
        <Columns>
            <asp:BoundField DataField="setReps" HeaderText="Reps" SortExpression="setReps" />
            <asp:BoundField DataField="setWeight" HeaderText="Weight" SortExpression="setWeight" />
            
        </Columns>
    </asp:GridView></div>
</asp:Content>
