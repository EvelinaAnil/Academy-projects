using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp__ADO_Shop
{
    public partial class Form1 : Form
    { private string connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;
private Buyer buyer;
        private SqlConnection _connection;
        public Form1()
        {
            InitializeComponent();
            
        }
        public void SelectDB(string commandText)
        {
            try
            {
                SqlConnection connection = new SqlConnection(connectionString);
                try
                {
                    //SqlCommand command = new SqlCommand(commandText, connection);
                    SqlCommand command = new SqlCommand
                    {
                        CommandText = commandText,
                        Connection = connection
                    };
                    try
                    {
                        connection.Open();

                        SqlDataReader reader = command.ExecuteReader(); //if select command
                        try
                        {
                            do
                            {
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        Console.Write($"{reader.GetName(i)}: {reader.GetValue(i)}\t\t");
                                    }
                                    Console.WriteLine();
                                }
                                Console.WriteLine("\n----------------------------\n");
                            } while (reader.NextResult()); //if есть следущ. запись
                        }
                        finally
                        {
                            reader.Close();
                        }
                    }
                    finally
                    {
                        command.Dispose(); //Утилизировать
                    }
                }
                finally
                {
                    connection.Close();
                }
            }
            catch
            {
                throw;
            }
        }


        private void button9_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    listBox.Items.Clear();

                    using (SqlCommand command = new SqlCommand("SELECT * FROM [Buyers];", connection))

                    {
                        SqlDataReader sqlReader = null;

                        try
                        {
                            sqlReader = command.ExecuteReader();

                            while (sqlReader.Read())
                            {
                                listBox.Items.Add(Convert.ToString(sqlReader["Id"]) + "    " + Convert.ToString(sqlReader["FirstName"]) + "       " + Convert.ToString(sqlReader["SecondName"]));
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message.ToString(), ex.Source.ToString(), MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        finally
                        {
                            if (sqlReader != null)
                                sqlReader.Close();
                        }

                    }
                    connection.Close();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    listBox_2.Items.Clear();

                    using (SqlCommand command = new SqlCommand("SELECT * FROM [Sellers];", connection))

                    {
                        SqlDataReader sqlReader = null;

                        try
                        {
                            sqlReader = command.ExecuteReader();

                            while (sqlReader.Read())
                            {
                                listBox_2.Items.Add(Convert.ToString(sqlReader["Id"]) + "    " + Convert.ToString(sqlReader["FirstName"]) + "       " + Convert.ToString(sqlReader["SecondName"]));
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message.ToString(), ex.Source.ToString(), MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        finally
                        {
                            if (sqlReader != null)
                                sqlReader.Close();
                        }

                    }
                    connection.Close();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void button12_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    listBox_3.Items.Clear();

                    using (SqlCommand command = new SqlCommand("SELECT Sales.Id,IdSellers,IdBuyers,Sum,DateOfSell, LevelBuyers,BlackBuyers FROM [Sales] , [Buyers],[Sellers] Where (IdSellers =Sellers.Id) and (IdBuyers =Buyers.Id) and (BlackBuyers =Buyers.Id) ;", connection))

                    {
                        SqlDataReader sqlReader = null;

                        try
                        {
                            sqlReader = command.ExecuteReader();

                            while (sqlReader.Read())
                            {
                                listBox_3.Items.Add(Convert.ToString(sqlReader["Id"]) + "    " + Convert.ToString(sqlReader["IdSellers"]) + "       " + Convert.ToString(sqlReader["IdBuyers"]) + "       " + Convert.ToString(sqlReader["Sum"]) + "       " + Convert.ToString(sqlReader["DateOfSell"])
                                    + "       " + Convert.ToString(sqlReader["LevelBuyers"]) + "       " + Convert.ToString(sqlReader["BlackBuyers"]));
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message.ToString(), ex.Source.ToString(), MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        finally
                        {
                            if (sqlReader != null)
                                sqlReader.Close();
                        }

                    }
                    connection.Close();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        //---------------------------------------INSERT------------------------------------
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    /*string text = $"INSERT INTO Students VALUES(@FirstName,@LastName,@IDGroup,@Term);";
                    //$"INSERT INTO Students VALUES('{student.FirstName}','{student.LastName}',{student.IDGroup},{student.Term});";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(text, connection))
                        {
                            Random random;
                            buyer.Id = random.;

                            SqlParameter parameter = new SqlParameter//sneller
                            {
                                ParameterName = "@FirstName",
                                Value = buyer.FirstName,
                                SqlDbType = SqlDbType.VarChar,
                                Size = 50
                            };
                            command.Parameters.Add(parameter);
                            parameter = new SqlParameter
                            {
                                ParameterName = "@LastName",
                                Value = buyer.LastName,
                                SqlDbType = SqlDbType.VarChar,
                                Size = 50
                            };
                            command.Parameters.Add(parameter);
                        }*/

                    if (!string.IsNullOrEmpty(textBox1.Text) && !string.IsNullOrWhiteSpace(textBox1.Text) &&
                !string.IsNullOrEmpty(textBox2.Text) && !string.IsNullOrWhiteSpace(textBox2.Text))
                    {
                        SqlCommand command = new SqlCommand("INSERT INTO [Buyers] (FirstName, SecondName)VALUES(@FirstName, @SecondName);", connection);

                        command.Parameters.AddWithValue("FirstName", textBox1.Text);

                        command.Parameters.AddWithValue("SecondName", textBox2.Text);

                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox1.Clear();
                    textBox2.Clear();
                    connection.Close();
                }
                
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                  

                    if (!string.IsNullOrEmpty(textBox3.Text) && !string.IsNullOrWhiteSpace(textBox3.Text) &&
                !string.IsNullOrEmpty(textBox4.Text) && !string.IsNullOrWhiteSpace(textBox4.Text) )
                    {
                        SqlCommand command = new SqlCommand("INSERT INTO [Sellers] (FirstName, SecondName)VALUES(@FirstName, @SecondName);", connection);

                        command.Parameters.AddWithValue("FirstName", textBox3.Text);

                        command.Parameters.AddWithValue("SecondName", textBox4.Text);

                        command.ExecuteNonQuery(); 
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                   textBox3.Clear();textBox4.Clear();
                    
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        //         if (!string.IsNullOrEmpty(textBox3.Text) && !string.IsNullOrWhiteSpace(textBox3.Text) &&
        //                !string.IsNullOrEmpty(textBox4.Text) && !string.IsNullOrWhiteSpace(textBox4.Text) &&
        //                !string.IsNullOrEmpty(textBox5.Text) && !string.IsNullOrWhiteSpace(textBox5.Text))
        //            {
        //                SqlCommand command = new SqlCommand("UPDATE [Products] SET [Name]=@Name, [Price]=@Price WHERE [Id]=@Id", sqlConnection);

        //        command.Parameters.AddWithValue("Id", textBox5.Text);
        //                command.Parameters.AddWithValue("Name", textBox4.Text);
        //                command.Parameters.AddWithValue("Price", textBox3.Text);

        //                await command.ExecuteNonQueryAsync();
        //    }
        //            else if (!string.IsNullOrEmpty(textBox4.Text) && !string.IsNullOrWhiteSpace(textBox4.Text))
        //            {
        //                label8.Visible = true;

        //                label8.Text = "Id должнен быть заполнен!";
        //            }
        //            else
        //{
        //    label8.Visible = true;

        //    label8.Text = "Поля 'Id', 'Имя' и 'Цена' должны быть заполнены!";
        //}
        private int id;
private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox5.Text) && !string.IsNullOrWhiteSpace(textBox5.Text) &&
                !string.IsNullOrEmpty(textBox22.Text) && !string.IsNullOrWhiteSpace(textBox22.Text)&&
                !string.IsNullOrEmpty(textBox17.Text) && !string.IsNullOrWhiteSpace(textBox17.Text)&&
                            !string.IsNullOrEmpty(textBox18.Text) && !string.IsNullOrWhiteSpace(textBox18.Text) &&
                        !string.IsNullOrEmpty(textBox25.Text) && !string.IsNullOrWhiteSpace(textBox25.Text) 
                    )
                    {
                        SqlCommand command = new SqlCommand("INSERT INTO [Sales] (Sum, DateOfSell,IdSellers,IdBuyers,LevelBuyers ,BlackBuyers)VALUES(@Sum, @DateOfSell, @IdSellers  ,@IdBuyers,@LevelBuyers ,@BlackBuyers);", connection);

                        command.Parameters.AddWithValue("Sum", textBox5.Text);

                        var dateFormat = "yyyy-MM-dd";
                        DateTime scheduleDate;
                        if ((DateTime.TryParseExact(textBox22.Text, dateFormat, DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out scheduleDate)) == true)
                        { 
                            command.Parameters.AddWithValue("DateOfSell", textBox22.Text);
                           command.Parameters.AddWithValue("IdSellers", textBox17.Text);
                            command.Parameters.AddWithValue("IdBuyers", textBox18.Text);
                            if (checkedListBox1.CheckedItems.Count < 2)
                        {

                            command.Parameters.AddWithValue("LevelBuyers", checkedListBox2.Text);
                            command.Parameters.AddWithValue("BlackBuyers", textBox25.Text);
                            command.ExecuteNonQuery();
                           
                        }
                        else
                        {
                            MessageBox.Show("Error met LevelBuyers only 1 add !!");
                        }

                        
                        }
                        else
                        {
                            MessageBox.Show("Error met Date of sell");
                        }

                        

                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    checkedListBox2.Text = null;
                    textBox25.Clear();
                    textBox5.Clear();
                    textBox22.Clear();
                    textBox17.Clear();
                    textBox18.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

      






        //---------------------------------------------------------------------------------


        //---------------------------------------UPDATE------------------------------------

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox10.Text) && !string.IsNullOrWhiteSpace(textBox10.Text) &&
                !string.IsNullOrEmpty(textBox9.Text) && !string.IsNullOrWhiteSpace(textBox9.Text)&&
                !string.IsNullOrEmpty(textBox11.Text) && !string.IsNullOrWhiteSpace(textBox11.Text))
                    {
                        SqlCommand command = new SqlCommand("UPDATE [Buyers] SET [FirstName]=@FirstName, [SecondName]=@SecondName WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox11.Text);
                        command.Parameters.AddWithValue("FirstName", textBox10.Text);

                        command.Parameters.AddWithValue("SecondName", textBox9.Text);

                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox10.Clear();
                    textBox9.Clear();
                    textBox11.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox12.Text) && !string.IsNullOrWhiteSpace(textBox12.Text) &&
                        !string.IsNullOrEmpty(textBox8.Text) && !string.IsNullOrWhiteSpace(textBox8.Text) &&
                        !string.IsNullOrEmpty(textBox7.Text) && !string.IsNullOrWhiteSpace(textBox7.Text))
                    {
                        SqlCommand command = new SqlCommand("UPDATE [Sellers] SET [FirstName]=@FirstName, [SecondName]=@SecondName WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox12.Text);
                        command.Parameters.AddWithValue("FirstName", textBox8.Text);

                        command.Parameters.AddWithValue("SecondName", textBox7.Text);

                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox12.Clear();
                    textBox8.Clear();
                    textBox7.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox13.Text) && !string.IsNullOrWhiteSpace(textBox13.Text) &&
                !string.IsNullOrEmpty(textBox20.Text) && !string.IsNullOrWhiteSpace(textBox20.Text) &&
                !string.IsNullOrEmpty(textBox19.Text) && !string.IsNullOrWhiteSpace(textBox19.Text)&&
                 !string.IsNullOrEmpty(textBox6.Text) && !string.IsNullOrWhiteSpace(textBox6.Text)&&
                 !string.IsNullOrEmpty(textBox21.Text) && !string.IsNullOrWhiteSpace(textBox21.Text)&&
                   !string.IsNullOrEmpty(textBox26.Text) && !string.IsNullOrWhiteSpace(textBox26.Text) //??
                )
                    {
                        SqlCommand command = new SqlCommand("UPDATE [Sales] SET [IdSellers]=@IdSellers, [IdBuyers]=@IdBuyers ,[Sum]=@Sum ,[DateOfSell]=@DateOfSell,[LevelBuyers]=@LevelBuyers,[BlackBuyers]=@BlackBuyers WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox13.Text);
                        command.Parameters.AddWithValue("IdSellers", textBox20.Text);

                        command.Parameters.AddWithValue("IdBuyers", textBox19.Text);
                        command.Parameters.AddWithValue("Sum", textBox6.Text);
                        var dateFormat = "yyyy-MM-dd";
                        DateTime scheduleDate;
                        if ((DateTime.TryParseExact(textBox21.Text, dateFormat, DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out scheduleDate))==true)
                        {
                             command.Parameters.AddWithValue("DateOfSell", textBox21.Text);
                            if (checkedListBox1.CheckedItems.Count ==1) 
                        {
                          
                            command.Parameters.AddWithValue("LevelBuyers", checkedListBox1.Text); 
                            command.Parameters.AddWithValue("BlackBuyers", textBox26.Text);
                            command.ExecuteNonQuery();
                        }
                        else
                        {
                            MessageBox.Show("Error met LevelBuyers only 1 add !!");
                        }
                        }
                        else
                        {
                            MessageBox.Show("Error met Date of sell");
                        }
                        

                      
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    
                    textBox26.Clear();
                    textBox13.Clear();
                    textBox20.Clear();
                    textBox19.Clear();
                    textBox6.Clear();
                    textBox21.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        

        //---------------------------------------------------------------------------------

        //---------------------------------------DELETE------------------------------------
            private void button8_Click(object sender, EventArgs e)
            {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox16.Text) && !string.IsNullOrWhiteSpace(textBox16.Text) )
                    {
                        SqlCommand command = new SqlCommand("DELETE FROM [Buyers] WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox16.Text);
                        
                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox16.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox15.Text) && !string.IsNullOrWhiteSpace(textBox16.Text))
                    {
                        SqlCommand command = new SqlCommand("DELETE FROM [Sellers] WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox15.Text);

                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox15.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

            private void button10_Click(object sender, EventArgs e)
            {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();


                    if (!string.IsNullOrEmpty(textBox14.Text) && !string.IsNullOrWhiteSpace(textBox16.Text))
                    {
                        SqlCommand command = new SqlCommand("DELETE FROM [Sales] WHERE [Id]=@Id;", connection);
                        command.Parameters.AddWithValue("Id", textBox14.Text);

                        command.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }
                    textBox14.Clear();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

       






        //---------------------------------------------------------------------------------
    }
}
