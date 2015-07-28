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
    public partial class newFoodLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if save wasn't clicked AND we have a foodlog in the url
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                getFoodLog();
            }
        }
        protected void getFoodLog()
        {
            //populate form with existing foodlog record
            Int32 fLogID = Convert.ToInt32(Request.QueryString["fLogID"]);

            //Try block incase there are any errors
            try {
            //connect to db via EF
            using (HealthLogEntities db = new HealthLogEntities())
            {
                //populate a student instance with the fLogID from the URL parameter
                foodLog s = (from objS in db.foodLogs
                             where objS.fLogID == fLogID
                             select objS).FirstOrDefault();


                //map the student properties to the form controls if we found a match
                if (s != null)
                {
                    //If editting, set the fields up
                    txtProtein.Text = Convert.ToString(s.protein);
                    txtFat.Text = Convert.ToString(s.fat);
                    txtCarbs.Text = Convert.ToString(s.carbs);
                    txtCalories.Text = Convert.ToString(s.calories);
                    var x = Convert.ToString(s.foodDate);
                    var q =  Convert.ToDateTime(x).ToShortDateString();
                    txtDate.Text = q;
                }
            }
            }
                //Catch any errors thrown and redirect
            catch(Exception y)
            {
                Response.Redirect("/error.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Get USERID for the saving foreign keys
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = authenticationManager.User.Identity.GetUserId();
            //Try block incase any errors are thrown
            try {
                //use EF to connect to SQL Server
                using (HealthLogEntities db = new HealthLogEntities())
                {

                    //use the foodLog model to save the new record
                    foodLog s = new foodLog();

                    Int32 fLogID = 0;

                    //check the querystring for an id so we can determine add / update
                    if (Request.QueryString["fLogID"] != null)
                    {
                        //get the id from the url
                        fLogID = Convert.ToInt32(Request.QueryString["fLogID"]);

                        //get the current student from EF
                        s = (from objS in db.foodLogs
                             where objS.fLogID == fLogID
                             select objS).FirstOrDefault();
                    }

                    //s.XXX = XXX.text for all variables.
                    s.userID = userIdentity;
                    s.fat = Convert.ToInt32(txtFat.Text);
                    s.protein = Convert.ToInt32(txtProtein.Text);
                    s.carbs = Convert.ToInt32(txtCarbs.Text);
                    s.calories = Convert.ToInt32(txtCalories.Text);
                    s.foodDate = Convert.ToDateTime(txtDate.Text);

                    //call add only if we have no student ID
                    if (fLogID == 0)
                    {
                        db.foodLogs.Add(s);
                    }


                    //run the update or insert
                    db.SaveChanges();

                    //redirect to the updated foodlog page
                    Response.Redirect("viewFoodLog.aspx");
                }
            }

            catch (System.Threading.ThreadAbortException lException)
            {

                // do nothing

            }
                //Catch any error and redirect
                catch(Exception z){
                    Response.Redirect("/error.aspx");
                }
            }
        }
    }
