<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="setsControl.ascx.cs" Inherits="Assignment2.setsControl" %>

<div class="col-lg-12 well "  runat="server">
    <h4>
    <asp:Label ID="lblSetNum" runat="server"></asp:Label><br />
    </h4>
        <label for="txtReps" runat="server" class="col-lg-offset-2" style="color:black">Reps:</label>
            <asp:TextBox  ID="txtReps" runat="server" required="true" MaxLength="3" style="color:black"/>
    <asp:RequiredFieldValidator id="RequiredFieldValidator2"
                    ControlToValidate="txtReps"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
        CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator1"
                   ControlToValidate="txtReps"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
   
        <label class="col-lg-offset-1" for="txtWeight" runat="server" style="color:black">Weight:</label>
            <asp:TextBox  ID="txtWeight" runat="server" required="true" MaxLength="4" style="color:black"/> 
    <asp:RequiredFieldValidator id="RequiredFieldValidator1"
                    ControlToValidate="txtWeight"
                    Display="Static"
                    ErrorMessage="Required*"
                    runat="server"
          CssClass="label label-danger"/> 
    <asp:RegularExpressionValidator id="RegularExpressionValidator2"
                   ControlToValidate="txtWeight"
                   ValidationExpression="\d+"
                   Display="Static"
                   EnableClientScript="true"
                   ErrorMessage="Please enter a numeric value"
                   runat="server"
        CssClass="label label-danger"/>
      
</div><br />
