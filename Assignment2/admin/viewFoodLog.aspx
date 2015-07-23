<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewFoodLog.aspx.cs" Inherits="Assignment2.viewFoodLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-md-6 col-md-offset-5">
        <h1>Food Log: </h1>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true"
             OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
            <asp:ListItem Value="3" Text="3" />
            <asp:ListItem Value="5" Text="5" />
            <asp:ListItem Value="999999" Text="All" />
        </asp:DropDownList>

         <asp:GridView ID="showFood" runat="server" AutoGenerateColumns="false" DataKeyNames="username"
         CssClass="table table-striped table-hover" OnRowDeleting="showFood_RowDeleting"
         AllowPaging="true" PageSize="3" OnPageIndexChanging="showFood_PageIndexChanging"
         AllowSorting="true" OnSorting="showFood_Sorting" OnRowDataBound="showFood_RowDataBound">
        <Columns>
            <asp:BoundField DataField="protein" HeaderText="Protein (in g)" SortExpression="protein" />
            <asp:BoundField DataField="carbs" HeaderText="Carbs(in g)" SortExpression="carbs" />
            <asp:BoundField DataField="fat" HeaderText="Fat (in g)" SortExpression="fat" />
            <asp:BoundField DataField="calories" HeaderText="Calories" SortExpression="calories" />
             <asp:BoundField DataField="foodDate" HeaderText="Date" SortExpression="foodDate" />
            <asp:HyperLinkField Text="Edit" NavigateUrl="addmeal.aspx" DataNavigateUrlFields="fLogID"
                 DataNavigateUrlFormatString="addmeal.aspx?fLogID={0}" HeaderText="Edit" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

    </div></div>
</asp:Content>
