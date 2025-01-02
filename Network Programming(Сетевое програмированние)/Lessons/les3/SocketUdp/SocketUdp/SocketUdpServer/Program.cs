using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace SocketUdpServer
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                IPAddress iPAddress = IPAddress.Parse("127.0.0.1");
                IPEndPoint endPoint = new IPEndPoint(iPAddress, 53415);

                Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Dgram, ProtocolType.Udp);

                try
                {
                    socket.Bind(endPoint);

                    Console.WriteLine("Waiting ...");

                    byte[] buffer = new byte[1000];
                    EndPoint point = new IPEndPoint(IPAddress.Any, 0);
                    int readBytes = socket.ReceiveFrom(buffer, ref point);
                    
                    IPEndPoint clientEP = point as IPEndPoint;
                    Console.WriteLine($"Received from {clientEP.Address}:{clientEP.Port}\n\n\t{Encoding.UTF8.GetString(buffer, 0, readBytes)}");

                    socket.SendTo(Encoding.UTF8.GetBytes("Hello"), point);
                }
                finally
                {
                    socket?.Shutdown(SocketShutdown.Both);
                    socket?.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadKey();
        }
    }
}
