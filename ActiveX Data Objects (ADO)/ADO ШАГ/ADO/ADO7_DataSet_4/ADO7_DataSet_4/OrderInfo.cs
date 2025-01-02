using ADO7_DataSet_4.DBClasses;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADO7_DataSet_4
{
    public partial class OrderInfo : Form
    {
        private NorthwindDB _northwindDB;
        private int _orderId;

        public OrderInfo(NorthwindDB northwindDB, int orderId)
        {
            InitializeComponent();

            _northwindDB = northwindDB;
            _orderId = orderId;
        }

        private void OrderInfo_Load(object sender, EventArgs e)
        {
            tbOrderNumber.DataBindings.Add("Text", _northwindDB.DataSet.Tables["OrdersID"], "OrderID", true);

            dtpOrderDate.DataBindings.Add("Value", _northwindDB.DataSet.Tables["OrdersID"], "OrderDate", true);

            tbEmployee.DataBindings.Add("Text", _northwindDB.DataSet.Tables["Employees"], "FullName", true);

            dgvOrderDetails.DataSource = _northwindDB.DataSet.Tables["OrderDetails"];

            _northwindDB.DataSet.Tables["OrderDetails"].Clear();
            _northwindDB.AdapterOrderDetails.SelectCommand.Parameters[0].Value = _orderId;
            _northwindDB.AdapterOrderDetails.Fill(_northwindDB.DataSet, "OrderDetails");
        }
    }
}
