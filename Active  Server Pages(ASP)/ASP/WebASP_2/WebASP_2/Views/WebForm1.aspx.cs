using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_2.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Image1.ImageUrl = "~/Images/Apollo.jpg";
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem!=null)
            {
                Label1.BackColor = Color.FromName(ListBox1.SelectedValue);
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write(string.Join("<br/>", CheckBoxList1.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Text)));
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //foreach (ListItem item in RadioButtonList1.Items)
            //{
            //    if (item.Selected)
            //    {
            //        // ...
            //        break;
            //    }
            //}

            Label1.Text = RadioButtonList1.Items.Cast<ListItem>().FirstOrDefault(l => l.Selected)?.Text;

            //if (string.IsNullOrEmpty(RadioButtonList1.SelectedValue))
            //{
            //    return;
            //}
            //Label1.Text = RadioButtonList1.SelectedValue;

            RadioButton3.Checked = !RadioButton3.Checked;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RadioButton radioButton = form1.Controls.Cast<Control>()
                .Where(c => c.GetType() == typeof(RadioButton))
                .FirstOrDefault(c => (c as RadioButton).GroupName == "#1" && (c as RadioButton).Checked) as RadioButton;
            
            if (radioButton != null)
            {
                Label1.Text = radioButton.Text;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label2.Text = Calendar1.SelectedDate < DateTime.Now ? "Date must be greater than ..." : Calendar1.SelectedDate.ToLongDateString();
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            Label3.Text = "";
            foreach (DateTime item in Calendar2.SelectedDates)
            {
                Label3.Text += $"{item.ToShortDateString()} ";
            }
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.Day == 28 && e.Day.Date.Month == 6)
            {
                e.Cell.BorderColor = Color.Yellow;
                e.Cell.BorderWidth = 4;
                e.Cell.ForeColor = Color.Blue;
                //e.Cell.Controls.Add(new LiteralControl("<br/>Constitution day"));
            }

            if (e.Day.Date<DateTime.Now)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
            //Server.Transfer("WebForm2.aspx");
        }
    }
}