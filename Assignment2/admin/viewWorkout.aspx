<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewWorkout.aspx.cs" Inherits="Assignment2.viewWorkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-md-6 col-md-offset-5">
        <h1>Workout Log: </h1>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
             OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="3" Text="3" />
            <asp:ListItem Value="5" Text="5" />
            <asp:ListItem Value="999999" Text="All" />
        </asp:DropDownList>

         <asp:GridView ID="showWorkout" runat="server" AutoGenerateColumns="false" DataKeyNames="username"
         CssClass="table table-striped table-hover" OnRowDeleting="showWorkout_RowDeleting"
         AllowPaging="true" PageSize="3" OnPageIndexChanging="showWorkout_PageIndexChanging"
         AllowSorting="true" OnSorting="showWorkout_Sorting" OnRowDataBound="showWorkout_RowDataBound">
        <Columns>
            <asp:BoundField DataField="muscleGroup" HeaderText="Muscle Group" SortExpression="MuscleGroup" />
            <asp:BoundField DataField="excercise" HeaderText="Excercise" SortExpression="excercise" />
            <asp:BoundField DataField="wSets" HeaderText="Sets" SortExpression="wSets" />
            <asp:BoundField DataField="wDate" HeaderText="Date" SortExpression="wDate" />
            <asp:HyperLinkField Text="Edit" NavigateUrl="addworkout.aspx" DataNavigateUrlFields="workoutLogID"
                 DataNavigateUrlFormatString="addworkout.aspx?workoutLogID={0}" HeaderText="Edit" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

    </div></div>
</asp:Content>
