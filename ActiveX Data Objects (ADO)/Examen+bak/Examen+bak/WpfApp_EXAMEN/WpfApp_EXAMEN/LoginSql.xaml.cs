using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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
using System.Xml;

namespace WpfApp_EXAMEN
{
    /// <summary>
    /// Interaction logic for LoginSql.xaml
    /// </summary>
    public partial class LoginSql : Window
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;
       
        public LoginSql()
        {
            InitializeComponent();
        }

        private void btnSubmit_Click(object sender, RoutedEventArgs e)
        {



            String mes = "Invalid Credentials!";

            //-----
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!String.IsNullOrEmpty(txtUserName.Text) && !String.IsNullOrWhiteSpace(txtPassword.Password) )
                
                    {
                        // using (SqlCommand command = new SqlCommand("SELECT * FROM User_ WHERE UserName=@Username AND User_Password=@Password;", connection)) 
                        // { 
                        //     command.CommandType = CommandType.Text;
                        // command.Parameters.AddWithValue("Username", txtUserName.Text.ToString());
                        // command.Parameters.AddWithValue("Password", txtPassword.Password.ToString());

                        //// command.ExecuteNonQuery();
                        //   SqlDataReader  reader = command.ExecuteReader();
                        //     if (reader.Read())
                        //     {
                        //         while (reader.Read())
                        //         {
                        //             if (Convert.ToString(reader["UserName"]) == txtUserName.Text.ToString() && Convert.ToString( reader["User_Password"]) == txtPassword.Password.ToString())
                        //             {
                        //                 mes = "1";
                        //             }
                        //         }
                        //     }
                        //     reader.Close();
                        //    reader.Dispose();
                        //     //mes = "1";
                        // command.Dispose();
                        // }

                        using (SqlCommand command = new SqlCommand("SELECT * FROM User_ WHERE UserName= '" + this.txtUserName.Text + "' AND User_Password= '"+ this.txtPassword.Password + "';", connection))
                        {
                          

                             command.ExecuteNonQuery();
                            SqlDataReader reader = command.ExecuteReader();
                            int count = 0;
                                while (reader.Read())
                                {
                                count = 1;
                                }
                            if (count == 1)
                            {
                                MainWindow main = new MainWindow();
                                main.Show();
                                this.Close();
                            }
                            else if (count > 1)
                            {
                                MessageBox.Show("Try Again");
                            }
                            else if(count<1){ MessageBox.Show(mes); }

                            reader.Close();
                            reader.Dispose();
                            command.Dispose();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    txtUserName.Clear();
                    txtPassword.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //if(mes =="1")
            //{
            //    MainWindow main = new  MainWindow();
            //    main.Show();
            //    this.Close();
            //}
            //else { MessageBox.Show(mes, "Info");}
                
        

    }

        private void regist_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            RegisterWindow register = new RegisterWindow();
            register.Show();
            this.Close();
        }
    }
    }

