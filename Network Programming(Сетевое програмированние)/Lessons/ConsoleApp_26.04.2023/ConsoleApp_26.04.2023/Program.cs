using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp_26._04._2023
{
     class Program
    {
        static void Main(string[] args)
        {
            //Simple Mail Transfer Protocol (SMTP)

            //Post Office Protocol (POP)
            //Internet Message Access Protocol (IMAP)

            MailMessage message = new MailMessage();

            message.From = new MailAddress("***@gmail_1.com");

            message.To.Add(new MailAddress("***@ukr_2.net"));

            Console.WriteLine("Input theme:");
            message.Subject = Console.ReadLine();

            Console.WriteLine("Message:");
            message.Body = Console.ReadLine();

            List<string> lines = new List<string>();
            //...
            foreach (string item in lines)
            {
                message.Attachments.Add(new Attachment(item));
            }

            string server = "smtp.gmail.com";

            SmtpClient smtpClient = new SmtpClient(server)
            {
                Port = 465, // 587
                Credentials = new NetworkCredential("****@gmail.com", "password"),
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network
            };

            try
            {
                smtpClient.Send(message);

                Console.WriteLine("Smtp OK!");
            }
            catch (SmtpException se)
            {
                Console.WriteLine($"Post message: {se.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


            Console.ReadKey();
        }
    }
}
