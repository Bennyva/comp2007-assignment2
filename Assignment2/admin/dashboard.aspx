<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Assignment2.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type='text/css'>
        body { background-image: url(/images/background.jpg); background-size:cover; background-repeat: no-repeat; }
    </style>
    <div class="row">
        <div class="row"><br /> <br /></div>
    <div class="container">
        <div class="jumbotron text-center col-md-5" style="background-image: url(/images/background2.jpg); background-size:cover; background-repeat: no-repeat; color:white;">
            <h1>Workout</h1>
           
            <a class="btn btn-primary btn-lg pull-left" href="/admin/newWorkout.aspx" role="button">Add Workout</a>
            <a class="btn btn-primary btn-lg pull-right" href="/admin/viewWorkout.aspx" role="button">Workout Log</a>

        </div>
      <div class="col-lg-2">

      </div>
        <div class="jumbotron text-center col-md-5" style="background-image: url(/images/background3.jpg); background-size:cover; background-repeat: no-repeat;color:white;">
            <h1>Food Log</h1>
            
                    <a class="btn btn-primary btn-lg pull-left" href="/admin/newFoodLog.aspx" role="button">Add Meal</a>
            <a class="btn btn-primary btn-lg pull-right" href="/admin/viewFoodLog.aspx" role="button">Food Log</a>
        </div>

    </div>
</div>
    <div class="row">
        <div class="container">
       
    </div>
        <div class="row">
        <div class="jumbotron col-md-8 col-md-offset-2 text-center" style="background-image: url(/images/user.jpg); background-size:cover; background-repeat: no-repeat;">

                <h1>My Account</h1>

                <p>
                    <a class="btn btn-primary btn-lg" href="/admin/userAccount.aspx" role="button">Settings</a>
                </p>

       </div>
    </div>
    </div>
    


</asp:Content>
