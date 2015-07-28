using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using Assignment2;

namespace Assignment2
{
    public partial class userAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                passwordChangedFlag.Visible = false;
            }
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userId = User.Identity.GetUserName();
            txtUsername.Text = userId;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Get the user ID, remove the old password, and set the new password.
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userId = User.Identity.GetUserId();
            if (txtPasswordConfirm.Text != "" || txtPasswordConfirm.Text != null)
            {
                //remove old pw
                userManager.RemovePassword(userId);
                //Set new pw
                userManager.AddPassword(userId, txtPasswordConfirm.Text);
                passwordChangedFlag.Visible = true;
            }
        }
    }
}