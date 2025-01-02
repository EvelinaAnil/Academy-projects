using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
    /// Interaction logic for RegisterWindow.xaml
    /// </summary>
    public partial class RegisterWindow : Window
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;
        public RegisterWindow()
        {
            InitializeComponent();
        }

        private void btnNewSubmit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!String.IsNullOrEmpty(txtNewUserName.Text) && !String.IsNullOrWhiteSpace(txtNewPassword.Password))

                    {
                        using (SqlCommand command = new SqlCommand("SELECT * FROM User_ WHERE UserName= '" + this.txtNewUserName.Text + "' AND User_Password= '" + this.txtNewPassword.Password + "';", connection))
                        {


                            command.ExecuteNonQuery();
                            SqlDataReader reader = command.ExecuteReader();
                            int count = 0;
                            while (reader.Read())
                            {
                                count = 1;
                            }
                            reader.Close();
                            reader.Dispose();
                            if (count == 1)
                            {
                                MessageBox.Show("This password or user is already exist!");
                            }
                            else if (count > 1)
                            {
                                MessageBox.Show("This password or user is already exist!");
                            }
                            else if (count < 1) {
                                //...add
                                if (!String.IsNullOrEmpty(txtNewUserName.Text) && !String.IsNullOrWhiteSpace(txtNewPassword.Password))
                                    {
                                using (SqlCommand command2 = new SqlCommand("INSERT INTO [User_] (UserName, User_Password)VALUES('" + this.txtNewUserName.Text + "', '" + this.txtNewPassword.Password + "');", connection)
                                          /*SqlCommand command2 = new SqlCommand("INSERT INTO [User_] (UserName, User_Password)VALUES(@Username, @User_Password);", connection)*/)
                                {
                                   
                                        //SqlCommand command2 = new SqlCommand("INSERT INTO [User_] (UserName, User_Password)VALUES(@Username, @User_Password);", connection);

                                        command2.Parameters.AddWithValue("FirstName", txtNewUserName.Text);

                                        command2.Parameters.AddWithValue("SecondName", txtNewPassword.Password);

                                        command2.ExecuteNonQuery();
                                  command2.Dispose();
                                        
                                }  
                                }
                                    
                                
                                else
                                    {
                                        MessageBox.Show("Error");
                                    }

                            }
                            else
                            {
                                MessageBox.Show("Error!!");
                            }

                           
                            command.Dispose();
                            
                        }
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    txtNewUserName.Clear();
                    txtNewPassword.Clear();
                    connection.Close();
                    LoginSql log = new LoginSql();
                    log.Show();
                    this.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
