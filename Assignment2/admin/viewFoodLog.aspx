<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewFoodLog.aspx.cs" Inherits="Assignment2.viewFoodLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type='text/css'>
        body { background-image: url(/images/background3.jpg); background-size:cover; background-repeat: no-repeat;}
    </style>
    <div class="row">
    <div class="col-lg-10 col-lg-offset-1">
        <h1>Food Log: </h1>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
             OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="7" Text="7" />
            <asp:ListItem Value="14" Text="14" />
            <asp:ListItem Value="999999" Text="All" />
        </asp:DropDownList>

         <asp:GridView ID="showFood" runat="server" AutoGenerateColumns="false" DataKeyNames="fLogID"
         CssClass="table table-striped table-hover" OnRowDeleting="showFood_RowDeleting"
         AllowPaging="true" PageSize="7" OnPageIndexChanging="showFood_PageIndexChanging"
         AllowSorting="true" OnSorting="showFood_Sorting" OnRowDataBound="showFood_RowDataBound">
        <Columns>
            <asp:BoundField DataField="fLogID" visible="false" SortExpression="fLogID" />
            <asp:BoundField DataField="protein" HeaderText="Protein (in g)" SortExpression="protein" />
            <asp:BoundField DataField="carbs" HeaderText="Carbs(in g)" SortExpression="carbs" />
            <asp:BoundField DataField="fat" HeaderText="Fat (in g)" SortExpression="fat" />
            <asp:BoundField DataField="calories" HeaderText="Calories" SortExpression="calories" />
             <asp:BoundField DataField="foodDate" HeaderText="Date" SortExpression="foodDate" />
            <asp:BoundField DataField="userID" Visible="false" SortExpression="userID" />
            <asp:HyperLinkField Text="Edit" NavigateUrl="newFoodLog.aspx" DataNavigateUrlFields="fLogID"
                 DataNavigateUrlFormatString="newFoodLog.aspx?fLogID={0}" HeaderText="Edit" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
        </div></div>

</asp:Content>
