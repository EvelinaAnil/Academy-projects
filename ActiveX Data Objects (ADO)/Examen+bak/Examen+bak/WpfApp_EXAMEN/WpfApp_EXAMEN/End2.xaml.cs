﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp_EXAMEN
{
    /// <summary>
    /// Interaction logic for End2.xaml
    /// </summary>
    public partial class End2 : Window
    {
        public End2()
        {
            InitializeComponent();
            lblnam.Content += " " + Environment.UserName;
            lbltime.Content += " " + DateTime.Now;
        }

        private void btnEnd_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
