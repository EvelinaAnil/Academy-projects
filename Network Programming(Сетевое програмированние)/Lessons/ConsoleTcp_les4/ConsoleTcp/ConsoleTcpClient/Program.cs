using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTcpClient
{
    class Program
    {
        static void Main(string[] args)
        {
			try
			{
				/* 1
				using (TcpClient tcpClient = new TcpClient())
				{
					tcpClient.Connect(IPAddress.Parse("127.0.0.1"), 54561); // remote
				*/

				/* 2
				using (TcpClient tcpClient = new TcpClient(new IPEndPoint(IPAddress.Loopback, 51116))) // local
				{
					tcpClient.Connect(IPAddress.Parse("127.0.0.1"), 54561); // remote
				*/

				// 3 -> without Connect()
				using (TcpClient tcpClient = new TcpClient("localhost", 54561)) // remote
				{

					using (NetworkStream stream = tcpClient.GetStream())
					{
						Console.WriteLine("Input message:");
						byte[] data = Encoding.UTF8.GetBytes(Console.ReadLine());
						stream.Write(data, 0, data.Length);
					}
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
