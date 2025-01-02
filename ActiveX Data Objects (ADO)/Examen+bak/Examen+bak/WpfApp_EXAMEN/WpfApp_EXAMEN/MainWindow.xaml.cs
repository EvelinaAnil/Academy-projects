/*using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;*/

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
using System.Windows.Navigation;
using System.Windows.Shapes;
namespace WpfApp_EXAMEN
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

        // create a new list of integers called question numbers
        // this interger will hold how many questions we have for this quiz and we will shuffle this inside the start game function
        List<int> questionNumbers = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        // create 3 more integers called qNum that will control which question shows on the screen, i and score
        int qNum = 0;
        int i;
        int score;
        int count = 0;
        public MainWindow()
        {

            InitializeComponent();
            // inside of the main constructor we will run the start game and next question function
            StartGame();
            NextQuestion();
           
        }
  

 
       
    
        
        private void checkAnswer(object sender, RoutedEventArgs e)
        {       
            if (count != 10) { 
            // this is the check answer event, this event is linked to each button on the canvas
            // when either of the buttons will be pressed we will run this event
            Button senderButton = sender as Button; // first check which button sent this event and link it to a local button inside of this event
            // in the if statement below we will check if the button clicked on has a 1 tag inside of it, if it does then we will add 1 to the score
            if (senderButton.Tag.ToString() == "1")
            {
                score++;

            }
            // if the qnum is less than 0 then we will reset the qnum integer to 0
            if (qNum < 0)
            {
                qNum = 0;
            }
            else
            {
                // if the qnum is greater than 0 then we will add 1 to the qnum integer
                qNum++;
            } 
                answ1.Visibility = Visibility.Hidden;
                answ2.Visibility = Visibility.Hidden;
            // update the score text label each time the buttons are pressed
            scoreText.Content = "Answered Correctly " + score + "/" + questionNumbers.Count;
                // run the next question function
                
                NextQuestion();
            count++;
               
            }
            else
            {
                txtQuestion.Text = "You answered all quentions!\n" +scoreText.Content ;
                quesionOrder.Content= "End";
                count = 0;
                ans1.Visibility= Visibility.Hidden;
                ans2.Visibility = Visibility.Hidden;
                exit.Visibility = Visibility.Visible;
                scoreText.Visibility = Visibility.Hidden;

               
            }
        }
        private void RestartGame()
        {
            // restart game function will load all of the default values for this game
            score = 0; // set score to 0
            qNum = -1; // set qnum to -1
            i = 0; // set i to 0
            StartGame(); // run the start game function
        }
        private void NextQuestion()
        {
            // this function will check which question to show next and it will have all of the question and answer definitions
            // in the if statement below it will checking if the qnum integer is less than the total number of questions if it then we will set the value of i to the value of qnum
            if (qNum < questionNumbers.Count)
            {
                i = questionNumbers[qNum];
            }
            else
            {
                // if we have done below the number of questions we have available then we will restart the game
                RestartGame();
            }
            // below we are running a foreach loop where will check for each button inside of the canvas and when we find them we will set their tag to 0 and background to dakr salmon colour
            foreach (var x in myCanvas.Children.OfType<Button>())
            {
                x.Tag = "0";
                x.Background = Brushes.DarkCyan;
                x.Foreground= Brushes.White;
            }
            // below you have all of the question and answers template
            // you can add your own questions to the txtQuestion section
            // and add your own answers inside of the ans1, ans2 content and so. 
            // this switch statement will check what value is inside of i integer and show the questions based on that value
            switch (i)
            {
                case 1:

                    
                    quesionOrder.Content = "Question 1";
                    txtQuestion.Text = "451 degrees Fahrenheit is how much in Celsius?"; // this the question for the quiz
                    ans1.Content = "232,78"; // each of the buttons can have their own answers in this game
                    ans2.Content = "327,93";
                    ans2.Tag = "1"; // here we tell the program which one of the answers above is the right answer by adding the 1 inside of the tag for the button. 
                    // in this example we adding 1 inside of ans2 or button 2
                    // so when the button is clicked the game will know which is the correct answer and it add 1 to the score for the game
                 //qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/1.jpg")); // here we will load the 1st image inside of the qimage 
                    break; // when this condition is met the program will break the switch statement here and wait for the next one
                    // rest of the condition will follow the same principle as this one
                case 2:

                    
                    quesionOrder.Content = "Question 2";
                    txtQuestion.Text = "Which of these battles took place in 1790?";
                    ans1.Content = "Capture of Ishmael";
                    ans2.Content = "Battle on the Ice";
                    ans1.Tag = "1";
                   // qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/2.jpg"));
                    break;
                case 3:

                    
                    quesionOrder.Content = "Question 3";
                    txtQuestion.Text = "Who is Svyatoslav Richter?";
                    ans1.Content = "The Seismologist ";
                    ans2.Content = "The Pianist";
                    ans2.Tag = "1";
                 //   qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/3.jpg"));
                    break;
                case 4:

                    
                    quesionOrder.Content = "Question 4";
                    txtQuestion.Text = "What does the word \"Ov\" mean in translation from the Komi-Zyryan language?";
                    ans1.Content = "Surname";
                    ans2.Content = "Family";
                    ans1.Tag = "1";
                 //   qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/4.jpg"));
                    break;
                case 5:

                    quesionOrder.Content = "Question 5";
                    txtQuestion.Text = "What does a herpetologist study?";
                    answ1.Visibility=Visibility.Visible;
                    answ2.Visibility = Visibility.Visible;
                    answ1.Tag = "1";
                    //   qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/5.jpg"));
                    break;
                case 6:

                    
                    quesionOrder.Content = "Question 6";
                    txtQuestion.Text = "Capital of Canada?";
                    ans1.Content = "Toronto";
                    ans2.Content = "Ottawa";
                    ans2.Tag = "1";
                 //   qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/6.jpg"));
                    break;
                case 7:

                    
                    quesionOrder.Content = "Question 7";
                    txtQuestion.Text = "What number from the Sun is the Earth?";
                    ans1.Content = "4";
                    ans2.Content = "3";
                    ans2.Tag = "1";
                 //   qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/7.jpg"));
                    break;
                case 8:

                   
                    quesionOrder.Content = "Question 8";
                    txtQuestion.Text = "Who gets the Pulitzer Prize?";
                    ans1.Content = "Journalists and writers";
                    ans2.Content = "Physicists and chemists";
                    ans1.Tag = "1";
                  //  qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/8.jpg"));
                    break;
                case 9:

                    
                    quesionOrder.Content = "Question 9";
                    txtQuestion.Text = "What object was kept by the talking \nhead from the poem \"Ruslan and Lyudmila\"?";
                    ans1.Content = "Axe";
                    ans2.Content = "Sword";
                    ans2.Tag = "1";
                  //  qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/9.jpg"));
                    break;
                case 10:

                    
                    quesionOrder.Content = "Question 10";
                    txtQuestion.Text = "Which of these colors is most loved by mosquitoes?";
                    ans1.Content = "Blue";
                    ans2.Content = "White";
                    ans1.Tag = "1";
                  //  qImage.Source = new BitmapImage(new Uri("pack://application:,,,/images/10.jpg"));
                    break;
            }
        }
        private void StartGame()
        {
            // this is the start game function
            // inside of this function we will randomise the questions list and save it back into the list 
            // create a new randomlist variable and use the line below to randomise the order of the content
            var randomList = questionNumbers.OrderBy(a => Guid.NewGuid()).ToList();
            // save the random list to the question numbers list again
            questionNumbers = randomList;
            // empty the question order label on the canvas
          //  questionOrder.Content = null;
            // run a for loop to add the value which will display the randomised list to the display so we can see how the list has been ramdomised
            for (int i = 0; i < questionNumbers.Count; i++)
            {
              //  questionOrder.Content += " " + questionNumbers[i].ToString();

            }
        }

        private void Exit(object sender, RoutedEventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                        LoginSql sql = new LoginSql();
                    
                        using (SqlCommand command = new SqlCommand("SELECT * FROM User_ WHERE UserName= '" + sql.txtUserName.Text + "' AND User_Password= '" + sql.txtPassword.Password + "';", connection))
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
                            else if (count < 1)
                            {
                            //...add
                            string text = scoreText.Content + "  " + sql.txtUserName.Text;



                                    using (SqlCommand command2 = new SqlCommand("INSERT INTO [Score] (Score)VALUES( '" + text + "');", connection)
                                              /*SqlCommand command2 = new SqlCommand("INSERT INTO [User_] (UserName, User_Password)VALUES(@Username, @User_Password);", connection)*/)
                                    {
                                command2.Parameters.AddWithValue("Score", text);


                                command2.ExecuteNonQuery();
                                        command2.Dispose();
                                    if (scoreText.Content.ToString() == ("Answered Correctly " + questionNumbers.Count + "/" + questionNumbers.Count).ToString() )
                                    {
                                    MessageBox.Show("You are awsome!");
                                    End End = new End();
                                     End.Show();
                                    }
                                    else
                                    {
                                    MessageBox.Show("You are not so good!");
                                    End2 end1 = new End2();
                                    end1.Show();

                                    }

                                    }
                                



                            }
                            else
                            {
                                MessageBox.Show("Error!!");
                            }


                            command.Dispose();

                        }
                  

                    connection.Close();
                     ans1.Visibility = Visibility.Visible;
            ans2.Visibility = Visibility.Visible;
            exit.Visibility = Visibility.Hidden;
            scoreText.Visibility = Visibility.Visible;
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
