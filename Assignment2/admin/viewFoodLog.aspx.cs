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
    public partial class viewFoodLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Sort coloumn and direction defaults
            if (!IsPostBack)
            {
                Session["SortColumn"] = "fLogID";
                Session["SortDirection"] = "ASC";
                getFoodLog();
            }
        }
        protected void getFoodLog()
        {
            //Get the userID for looking up
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = authenticationManager.User.Identity.GetUserId();
            //Try block incase any errors are thrown
            try
            {
                //connect with EF to the SQL server
                using (HealthLogEntities db = new HealthLogEntities())
                {
                    //Set sortstring
                    String SortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    //Select the logs from foodlogs
                    var Logs = from c in db.foodLogs
                               where c.userID == userIdentity
                               select new { c.fLogID, c.protein, c.carbs, c.fat, c.calories, c.foodDate, c.userID };
                    //If not null, display the logs
                    if (Logs != null)
                    {
                        showFood.DataSource = Logs.AsQueryable().OrderBy(SortString).ToList();
                        showFood.DataBind();
                    }
                }
            }
                //Catch any errors therown and redirect
            catch(Exception r)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void showFood_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Check for postback
            if (IsPostBack)
            {
                //Set the sort images depending on coloumn and sort direction
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    System.Web.UI.WebControls.Image SortImage = new System.Web.UI.WebControls.Image();

                    for (int i = 0; i <= showFood.Columns.Count - 1; i++)
                    {
                        if (showFood.Columns[i].SortExpression == Session["SortColumn"].ToString())
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

        protected void showFood_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            //reload the grid
            getFoodLog();

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

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            showFood.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
           getFoodLog();
        }

        protected void showFood_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                        //get food log id
            Int32 fLogID = Convert.ToInt32(showFood.DataKeys[e.RowIndex].Values["fLogID"]);
            //Try block to catch any errors
            try
            {
                //Connect to the DB with EF
                using (HealthLogEntities db = new HealthLogEntities())
                {
                    //get selected log
                    foodLog objC = (from c in db.foodLogs
                                    where c.fLogID == fLogID
                                    select c).FirstOrDefault();

                    //delete
                    db.foodLogs.Remove(objC);
                    db.SaveChanges();

                    //refresh grid
                    getFoodLog();
                }
            }
                //Catch any errors thrown and redirect to error page
            catch (Exception s)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void showFood_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            showFood.PageIndex = e.NewPageIndex;
            getFoodLog();
        }
    }
}