using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace SocketTcpServer
{
     class Program
    {
        static void Main(string[] args)
        {
            try
            {
                IPHostEntry hostEntry = Dns.GetHostEntry("localhost");
                IPAddress iPAddress = hostEntry.AddressList[0];
                IPEndPoint localEndPoint = new IPEndPoint(iPAddress, 53456);

                Socket socket = new Socket(iPAddress.AddressFamily,
                    SocketType.Stream, ProtocolType.Tcp);
                try
                {
                   socket.Bind(localEndPoint);
                    socket.Listen(5);

                    while (true)
                    {
                        Console.WriteLine("listening...");

                        Socket acceptSocket = socket.Accept();

                        StringBuilder stringBuilder = new StringBuilder();
                        byte[] bytes;
                        int byteRec, marker;
                        while (true)
                        {
                            bytes = new byte[500];
                            byteRec= acceptSocket.Receive(bytes);
                            stringBuilder.Append
                                (Encoding.UTF8.GetString(bytes,0,byteRec));

                            marker = stringBuilder.ToString().LastIndexOf("<Plus>");
                            if (marker>-1)
                            {
                                break;
                            }

                        }
                        Console.WriteLine($"Message: {stringBuilder.ToString().Substring(0,marker)}");
                        acceptSocket.Send(Encoding.UTF8.GetBytes($"Thanks {stringBuilder.Length} bytes recieved."));
                    }
                }
                finally 
                {  
                    socket?.Shutdown(SocketShutdown.Both);
                    socket?.Close();
                }


            }
            catch (Exception ex)
            { Console.WriteLine(ex.Message); }




            Console.ReadKey();
        }
    }
}
