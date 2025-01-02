using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WFAppADO7_1.DBClasses;

namespace WFAppADO7_1
{
    public partial class Form1 : Form
    {
        private NorthwindDB _northwindDB;
        public Form1()
        {
            try
            {
                _northwindDB = new NorthwindDB();
            }
            catch (Exception ex)
            {

                MessageBox.Show($"{ex.Message}");
                Application.Exit();
            }


            InitializeComponent();


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cbCustomers.DataSource = _northwindDB.DataSet.Tables["Customers"];
            cbCustomers.DisplayMember = "CompanyName";
            cbCustomers.ValueMember = "CustomerId";

            dgvOrders.DataSource = _northwindDB.DataSet.Tables["Orders"];

            tbOrderNumber.DataBindings.Add("Text", _northwindDB.DataSet.Tables["OrdersID"], "OrderID");

            dtpOrderDate.DataBindings.Add("Value", _northwindDB.DataSet.Tables["Orders"], "OrderDate");

            tbEmployee.DataBindings.Add("Text", _northwindDB.DataSet.Tables["Employees"], "FullName");

            RefreshOrders();
        }

        private void dgvOrders_Click(object sender, EventArgs e)
        {

        }

        private void cbCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void RefreshOrders()
        {
            if(cbCustomers.SelectedIndex!=-1)
            {
                _northwindDB.DataSet.Tables["Orders"].Clear();
                _northwindDB.AdapterOrders.SelectCommand.Parameters[0].Value = cbCustomers.SelectedValue.ToString();

                _northwindDB.AdapterOrders.Fill(_northwindDB.DataSet, "Orders");
            }
        }
    }
}
