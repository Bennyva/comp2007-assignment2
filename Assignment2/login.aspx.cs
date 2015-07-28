using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//auth references
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace Assignment2
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Find username and password enter
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(txtUsername.Text, txtPassword.Text);
            //If the user is found, redirect to dashboard
            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                //Redirect
                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                Response.Redirect("admin/dashboard.aspx");
            }
            //Otherwise display error to user.
            else
            {
                lblStatus.Text = "Invalid username or password.";
            }
        }
    }
}