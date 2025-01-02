using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class ViewState : System.Web.UI.Page
    {
        private Dictionary<string, string> _dict; // 2
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            _dict = new Dictionary<string, string>(); // 2

            SaveAllText(Table1.Controls);

            ViewState["dict"] = _dict; // 2
        }

        private void SaveAllText(ControlCollection controls)
        {
            foreach (Control item in controls)
            {
                if (item is TextBox textBox)
                {
                    //ViewState[textBox.ID] = textBox.Text; // 1

                    // 2
                    if (!_dict.ContainsKey(textBox.ID))
                    {
                        _dict.Add(textBox.ID, textBox.Text);
                    }
                    else
                    {
                        _dict[textBox.ID] = textBox.Text;
                    }
                }
                if (item.Controls != null)
                {
                    SaveAllText(item.Controls);
                }
            }
        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            RestoreAllText(Table1.Controls);
        }

        private void RestoreAllText(ControlCollection controls)
        {
            /* 1
            foreach (Control item in controls)
            {
                if (item is TextBox textBox && ViewState[textBox.ID] != null)
                {
                    textBox.Text = ViewState[textBox.ID].ToString();
                }
                if (item.Controls != null)
                {
                    RestoreAllText(item.Controls);
                }
            }*/

            // 2
            TextBox textBox;
            _dict = ViewState["dict"] as Dictionary<string, string>;
            if (_dict != null)
            {
                foreach (var item in _dict)
                {
                    textBox = Page.FindControl(item.Key) as TextBox;
                    if (textBox != null)
                    {
                        textBox.Text = item.Value;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClearAllText(Table1.Controls);
        }

        private void ClearAllText(ControlCollection controls)
        {
            foreach (Control item in controls)
            {
                if (item is TextBox textBox)
                {
                    textBox.Text = "";
                }
                if (item.Controls != null)
                {
                    ClearAllText(item.Controls);
                }
            }
        }
    }
}