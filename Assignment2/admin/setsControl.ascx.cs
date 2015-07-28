using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment2
{
    public partial class setsControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void setReps(string i)
        {
            txtReps.Text = i;
        }
        public void setWeight(string i)
        {
            txtWeight.Text = i;
        }

        public void setLbl(int num)
        {
            //Sets the title for the user control
            lblSetNum.Text = "Set " + num;

        }

        public int getReps()
        {
            //returns the reps for this user control
            return Convert.ToInt32(txtReps.Text);
        }
        public int getWeight()
        {
            //returns the weight for this user control
            return Convert.ToInt32(txtWeight.Text);
        }
    }
}