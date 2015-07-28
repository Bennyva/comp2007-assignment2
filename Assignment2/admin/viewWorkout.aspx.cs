using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment2.Models;
using System.Linq.Dynamic;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Drawing;

namespace Assignment2
{
    public partial class viewWorkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SortColumn"] = "workoutLogID";
                Session["SortDirection"] = "ASC";
                getWorkoutLog();
                getSetsLog();
            }
        }

         protected void getWorkoutLog()
         {
             //Get userID for viewing based off ID
             var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = authenticationManager.User.Identity.GetUserId();
             //Try block incase an error is thrown
            try
            {
                //Connect with EF
                using (HealthLogEntities db = new HealthLogEntities())
                {
                    //Select the coloumns we need for the grid, and default sort
                    String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    var Logs = from c in db.workoutLogs
                               where c.userID == userIdentity
                               select new { c.workoutLogID, c.userID, c.muscleGroup, c.excercise, c.wSets, c.wDate };
                    if (Logs != null)
                    {
                        //Bind the data to the gridview
                        showWorkout.DataSource = Logs.AsQueryable().OrderBy(SortString).ToList();
                        showWorkout.DataBind();
                    }

                }
            }
                //Catch any errors and redirect to the error page
             catch(Exception r)
            {
                Response.Redirect("/error.aspx");
            }
         }
         protected void getSetsLog()
         {
             //set variable for the ID
             Int32 workoutLogID = 0;
             //Check for query string in the URL
             if (Request.QueryString["workoutLogID"] != null)
             {
                 //get the id from the url
                 workoutLogID = Convert.ToInt32(Request.QueryString["workoutLogID"]);
                 //Try block incase any errors are thrown in EF
                 try
                 {
                     //Connect to EF
                     using (HealthLogEntities db = new HealthLogEntities())
                     {
                         //get the current sets for the workoutLogID from EF
                         var w = from objC in db.setsLogs
                                 where objC.setID == workoutLogID
                                 select new { objC.setID, objC.ID, objC.setReps, objC.setWeight };
                         //Bind the data to the second gridview if not null
                         if (w != null)
                         {
                             //Bind
                             showSetsLog.DataSource = w.ToList();
                             showSetsLog.DataBind();
                         }
                     }
                 }
                     //Catch any errors thrown and redirect to error page
                 catch(Exception s)
                 {
                     Response.Redirect("/error.aspx");
                 }
             }
         }
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Change the page size to selected value
            showWorkout.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            getWorkoutLog();
        }

        protected void showWorkout_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Check for postback
            if (IsPostBack)
            {
                //Change image based on sort type
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    System.Web.UI.WebControls.Image SortImage = new System.Web.UI.WebControls.Image();

                    for (int i = 0; i <= showWorkout.Columns.Count - 1; i++)
                    {
                        if (showWorkout.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "/images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "/images/asc.jpg";
                                SortImage.AlternateText = "Sort Ascending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }

            }
            
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Alternate)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#D1F0FF'");
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#E6E6E6'");
                    e.Row.BackColor = Color.FromName("#E6E6E6");
                }
            }
            else
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#D1F0FF'");
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF'");
                    e.Row.BackColor = Color.FromName("#FFFFFF");
                }

                //e.Row.Cells[0].BackColor = Color.FromName("gray");
                //e.Row.Cells[1].BackColor = Color.FromName("gray");
                //e.Row.Cells[2].BackColor = Color.FromName("gray");
                //e.Row.Cells[3].BackColor = Color.FromName("gray");
                //e.Row.Cells[4].BackColor = Color.FromName("gray");
                //e.Row.BorderWidth = 2;
                //e.Row.BorderColor = Color.FromName("#43C6DB");
            }
        }

        protected void showWorkout_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            //reload the grid
            getWorkoutLog();

            //toggle the direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void showWorkout_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //get workoutLogID
            Int32 workoutLogID = Convert.ToInt32(showWorkout.DataKeys[e.RowIndex].Values["workoutLogID"]);
            //Try block incase EF throws any errors
            try {
                //Use EF to connect to DB
                using (HealthLogEntities db = new HealthLogEntities())
                {
                    //get selected workout
                    workoutLog objC = (from c in db.workoutLogs
                                       where c.workoutLogID == workoutLogID
                                       select c).FirstOrDefault();
                    //For loop for each set, up to potentially 5
                    for (int i = 0; i < 5; i++)
                    {
                        //Get each set with the workoutLogID we are deleting
                        setsLog objD = (from d in db.setsLogs where d.setID == objC.workoutLogID select d).FirstOrDefault();
                        if (objD != null)
                        {
                            //Remove each set from that workout
                            db.setsLogs.Remove(objD);
                            db.SaveChanges();
                        }
                    }
                    //Delete the workout itself
                    db.workoutLogs.Remove(objC);
                    db.SaveChanges();
                }
            }
                //Catch any errors and redirect
                catch(Exception q){
                    Response.Redirect("/error.aspx");
                }
                //refresh grid
                getWorkoutLog();
            }
        protected void showWorkout_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            showWorkout.PageIndex = e.NewPageIndex;
            getWorkoutLog();
        }
    }
}