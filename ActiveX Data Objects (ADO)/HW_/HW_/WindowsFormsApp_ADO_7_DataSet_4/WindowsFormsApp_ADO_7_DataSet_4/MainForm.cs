using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApp_ADO_7_DataSet_4.DBClasses;

namespace WindowsFormsApp_ADO_7_DataSet_4
{
    public partial class MainForm : Form
    {
        private NorthwindDB _northwindDB;

        public MainForm()
        {
            try
            {
                _northwindDB= new NorthwindDB();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                Application.Exit();
            }


            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            cbCustomers.DataSource = _northwindDB.DataSet.Tables["Author"];
            cbCustomers.DisplayMember = "FirstName";
            cbCustomers.ValueMember = "Id";

            dgvOrders.DataSource = _northwindDB.DataSet.Tables["Book"];

            tbOrderNumber.DataBindings.Add("Text", _northwindDB.DataSet.Tables["Book"], "Name",true);

            dtpOrderDate.DataBindings.Add("Text", _northwindDB.DataSet.Tables["Author"], "FirstName", true);

            tbEmployee.DataBindings.Add("Text", _northwindDB.DataSet.Tables["Author"], "SecondName", true);

            RefreshOrders();
        }
        private void RefreshOrders()
        {
            if (cbCustomers.SelectedIndex != -1)
            {
                _northwindDB.DataSet.Tables["Book"].Clear();

                _northwindDB.AdapterOrders.SelectCommand.
                    Parameters[0].Value = cbCustomers.SelectedValue.ToString();

                _northwindDB.AdapterOrders.Fill(_northwindDB.DataSet, "Book");
            }
        }
        private void cbCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            RefreshOrders();
        }

       

        private void dgvOrders_Click(object sender, EventArgs e)
        {
            try
            {
               int orderId= Convert.ToInt32(
                _northwindDB.DataSet.Tables["Book"]
                    .Rows[dgvOrders.CurrentCell.RowIndex]["Book"]
            );

                _northwindDB.DataSet.Tables["Book"].Clear();
                _northwindDB.AdapterOrdersId.SelectCommand.Parameters[0].Value = orderId;

                _northwindDB.AdapterOrdersId.Fill(_northwindDB.DataSet, "Book");


                _northwindDB.DataSet.Tables["Author"].Clear();

                _northwindDB.AdapterEmployees.SelectCommand.Parameters[0].Value = _northwindDB.DataSet.Tables["Book"].Rows[0]["Author"];

                _northwindDB.AdapterEmployees.Fill(_northwindDB.DataSet, "Author");

                //
                //OrderInfo orderInfo= new OrderInfo(_northwindDB,orderId);
                //orderInfo.ShowDialog();

            }
            catch (IndexOutOfRangeException)
            {

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void btnDataView_Click(object sender, EventArgs e)
        {
            DataView dataView = new DataView
            {
                Table = _northwindDB.DataSet.Tables["Author"],
                RowFilter = "Id = 'ANATR'"
            };
            dgvDataView.DataSource = dataView;
        }

       
    }
}
