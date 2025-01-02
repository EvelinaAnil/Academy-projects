using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTcpServer
{
    class Program
    {
        static void Main(string[] args)
        {
			try
			{
				TcpListener tcpListener = new TcpListener(IPAddress.Parse("127.0.0.1"), 54561);
				tcpListener.Start();

				Console.WriteLine("Listening ...");

				TcpClient tcpClient = tcpListener.AcceptTcpClient();

				IPEndPoint clientEP = tcpClient.Client.RemoteEndPoint as IPEndPoint;
				Console.WriteLine($"IPAddress: {clientEP?.Address}, Port: {clientEP?.Port}");

				NetworkStream stream = tcpClient.GetStream();
				try
				{
					byte[] data = new byte[1000];
					stream.Read(data, 0, data.Length);

					Console.WriteLine($"Data: {Encoding.UTF8.GetString(data)}");
				}
				finally
				{
					stream.Close();
					tcpClient.Close();
					tcpListener.Stop();
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
