using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp__les1
{
     class Program
    {
        //--------1--------

        /*static void Main(string[] args)
        {
            // IPv4-адрес: 192.168.3.104
            // Маска подсети: 255.255.252.0


            //Domain Name Service (DNS)
            string hostName = "www.google.com";

            //HostEntry hostEntry = Dns.GetHostEntry(hostName);

            //Console.WriteLine("\nAddress:\n");
            
            //foreach (IPAddress item in hostEntry.AddressList)
            //{
            //    Console.WriteLine(item);
            //}

            //Console.WriteLine("\nAliases:\n");
            //foreach(string item in hostEntry.Aliases)
            //{
            //    Console.WriteLine(item);
            //}

            //Console.WriteLine($"Real name: {hostEntry.HostName}");

            Dns.BeginGetHostEntry(hostName,HostCallback,null);

            Console.ReadKey();
        }

        private static void HostCallback(IAsyncResult ar)
        {

            string hostName = "www.google.com";
            IPHostEntry hostEntry = Dns.GetHostEntry(hostName);
            Console.WriteLine("\nAddress:\n");

            foreach (IPAddress item in hostEntry.AddressList)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine("\nAliases:\n");
            foreach (string item in hostEntry.Aliases)
            {
                Console.WriteLine(item);
            }

            Console.WriteLine($"Real name: {hostEntry.HostName}");

        }*/


        //----------2--------

        /*static void Main(string[] args)
        {
            // Uniform Resource Identifiers     (URI)
            // Uniform Resource Locator         (URL)
            // Uniform Resource Name            (URN)

            Uri baseUri = new Uri("https://docs.microsoft.com");
            Uri newUri = new Uri(baseUri,
            "en-us/cpp/?view=msvc-170&viewFallbackFrom=vs-2017");


            Console.WriteLine($"Absolute Uri:   {newUri.AbsoluteUri}");
            Console.WriteLine($"Query:          {newUri.Query}");
            Console.WriteLine($"Port:           {newUri.Port}");

            Uri uri = new Uri("https://docs.microsoft.com");


            //request.Proxy.Credentials  =
            //new NetworkCredential("login", "password");

            WebRequest request = WebRequest.Create(uri);

            using (WebResponse response = request.GetResponse())
            {
                Stream stream = response.GetResponseStream();
                using (StreamReader reader = new StreamReader(stream))
                {
                    Console.WriteLine(reader.ReadToEnd());
                }
            }



                Console.ReadKey();
        }*/


        static void Main(string[] args)
        {

            IPAddress iPAddress = IPAddress.Any;
             iPAddress = IPAddress.Loopback;
            iPAddress = IPAddress.Broadcast;
            iPAddress = IPAddress.Parse("127.0.0.1");

            Console.WriteLine(iPAddress);

            bool isConnected;
            Socket socket = null;

            for (int i = 135; i < 500; i++) //445
            {
                isConnected = false;
                try
                {
                    IPEndPoint iPEndPoint = new IPEndPoint
                        (iPAddress, i);
                    socket = new Socket
      (iPAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                    socket.Connect(iPEndPoint);

                    Console.WriteLine($"Port: {i}  is  listening!");

                    isConnected = socket.Connected;
                    
                }
                catch (SocketException ex)
                {
                    if (ex.ErrorCode!=10061)
                    {
                        Console.WriteLine("Port:"+ex.Message);
                    }
                    Console.WriteLine(ex.Message);

                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    
                } 
                finally {
                    if (isConnected==true)
                    {
                        socket.Shutdown(SocketShutdown.Both);
                    }socket?.Close();
                }
            }

            Console.ReadKey();
        }

        
    
    }

}
