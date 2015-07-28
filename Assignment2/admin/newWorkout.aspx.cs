using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Dynamic;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using Assignment2.Models;
namespace Assignment2
{
    public partial class newWorkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a workout in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                getWorkoutLog();
                setsControl1.Visible = false;
                setsControl2.Visible = false;
                setsControl3.Visible = false;
                setsControl4.Visible = false;
                setsControl5.Visible = false;
            }
            
        }
        protected void getWorkoutLog()
        {
            //populate form with existing workout record
            Int32 workoutLogID = Convert.ToInt32(Request.QueryString["workoutLogID"]);
            //Try data connection, incase of errors
            try
            {
                //connect to db via EF
                using (HealthLogEntities db = new HealthLogEntities())
                {
                    //populate a workout instance with the workoutLogID from the URL parameter
                    workoutLog s = (from objS in db.workoutLogs
                                    where objS.workoutLogID == workoutLogID
                                    select objS).FirstOrDefault();
                    //populate a set instance with the workoutLogID from the URL parameter
                    setsLog q = (from objC in db.setsLogs
                                 where objC.setID == s.workoutLogID
                                 select objC).FirstOrDefault();
                    //map the workout properties to the form controls if we found a match
                    if (s != null && q != null)
                    {
                        txtExcercise.Text = s.excercise;
                        ddlMuscleGroup.SelectedValue = s.muscleGroup;
                        txtDate.Text = Convert.ToString(s.wDate);
                        ddlSets.SelectedValue = Convert.ToString(s.wSets);
                        
                    }
                }
            }
            catch(Exception R)
            {
                //If an error is thrown redirect to the error page
                Response.Redirect("/error.aspx");
            }
        }
        protected void ddlSets_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Switch statement to show user controls for each set the user did in their workout
                          switch(Convert.ToInt32(ddlSets.SelectedValue))
                {
                    case(1):
                        setControlsFalse();
                        setsControl1.Visible=true;
                        break;
                    case(2):
                        setControlsFalse();
                        setsControl1.Visible=true;
                        setsControl2.Visible = true;
                        break;
                    case (3):
                        setControlsFalse();
                        setsControl1.Visible = true;
                        setsControl2.Visible = true;
                        setsControl3.Visible = true;
                        break;
                    case (4):
                        setControlsFalse();
                        setsControl1.Visible = true;
                        setsControl2.Visible = true;
                        setsControl3.Visible = true;
                        setsControl4.Visible = true;
                        break;
                    case (5):
                        setControlsFalse();
                        setsControl1.Visible = true;
                        setsControl2.Visible = true;
                        setsControl3.Visible = true;
                        setsControl4.Visible = true;
                        setsControl5.Visible = true;
                        break;
                }
                //Set the Set # label for each control
                setsControl1.setLbl(1);
                setsControl2.setLbl(2);
                setsControl3.setLbl(3);
                setsControl4.setLbl(4);
                setsControl5.setLbl(5);
        }

        

        protected void setControlsFalse()
        {
            //Makes all the user controls invisible.
            setsControl1.Visible = false;
            setsControl2.Visible = false;
            setsControl3.Visible = false;
            setsControl4.Visible = false;
            setsControl5.Visible = false;
        }




        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Get the users ID for storing in the DB
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = authenticationManager.User.Identity.GetUserId();
            //Try statement incase an error is thrown


            try
            {
                //use EF to connect to SQL Server
                using (HealthLogEntities db = new HealthLogEntities())
                {

                    //use the Student model to save the new record
                    workoutLog s = new workoutLog();
                    Int32 workoutLogID = 0;
                    //check the querystring for an id so we can determine add / update
                    if (Request.QueryString["workoutLogID"] != null)
                    {
                        //get the id from the url
                        workoutLogID = Convert.ToInt32(Request.QueryString["workoutLogID"]);
                        //get the current workout from EF
                        s = (from objS in db.workoutLogs
                             where objS.workoutLogID == workoutLogID
                             select objS).FirstOrDefault();
                    }
                    //s.XXX = XXX.text for all variables. setting them in the DB
                    s.excercise = txtExcercise.Text;
                    s.muscleGroup = ddlMuscleGroup.SelectedValue;
                    s.userID = userIdentity;
                    s.wDate = Convert.ToDateTime(txtDate.Text);
                    s.wSets = Convert.ToInt32(ddlSets.SelectedValue);

                    //call add only if we have no workout ID
                    if (workoutLogID == 0)
                    {
                        db.workoutLogs.Add(s);
                    }

                    //run the update or insert
                    db.SaveChanges();
                    //New set variable
                    setsLog q = new setsLog();
                    Int32 setID = 0;
                    //check to see if editting with the query string
                    if (Request.QueryString["setID"] != null)
                    {
                        //get the id from the url
                        setID = Convert.ToInt32(Request.QueryString["setID"]);

                        //get the current student from EF
                        q = (from objC in db.setsLogs
                             where objC.setID == s.workoutLogID
                             select objC).FirstOrDefault();
                    }
                    //If there is no set in the url
                    if (setID == 0)
                    {
                        //switch statement to add each set of weight/reps to the database depending on how many they chose
                        switch (Convert.ToInt32(ddlSets.SelectedValue))
                        {
                            case (1):
                                q.setReps = setsControl1.getReps();
                                q.setWeight = setsControl1.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                break;
                            case (2):
                                q.setReps = setsControl1.getReps();
                                q.setWeight = setsControl1.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl2.getReps();
                                q.setWeight = setsControl2.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                break;
                            case (3):
                                q.setReps = setsControl1.getReps();
                                q.setWeight = setsControl1.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl2.getReps();
                                q.setWeight = setsControl2.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl3.getReps();
                                q.setWeight = setsControl3.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                break;
                            case (4):
                                q.setReps = setsControl1.getReps();
                                q.setWeight = setsControl1.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl2.getReps();
                                q.setWeight = setsControl2.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl3.getReps();
                                q.setWeight = setsControl3.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl4.getReps();
                                q.setWeight = setsControl4.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                break;
                            case (5):
                                q.setReps = setsControl1.getReps();
                                q.setWeight = setsControl1.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl2.getReps();
                                q.setWeight = setsControl2.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl3.getReps();
                                q.setWeight = setsControl3.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl4.getReps();
                                q.setWeight = setsControl4.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                q.setReps = setsControl5.getReps();
                                q.setWeight = setsControl5.getWeight();
                                q.setID = s.workoutLogID;
                                //Add the rep(s) and weight(s) to the DB
                                db.setsLogs.Add(q);
                                db.SaveChanges();
                                break;
                        }
                    }
                    //Send the user to the view workout page
                    Response.Redirect("viewWorkout.aspx");
                }
            }
            catch (System.Threading.ThreadAbortException lException)
            {

                // do nothing

            }
                //catch if an error is thrown and redirect to the error page
            catch(Exception T)
            {
                Response.Redirect("/error.aspx");
            }
        }
    }
}