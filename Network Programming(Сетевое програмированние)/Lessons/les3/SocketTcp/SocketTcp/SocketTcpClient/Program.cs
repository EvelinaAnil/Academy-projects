using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace SocketTcpClient
{
    class Program
    {
        static void Main(string[] args)
        {
			try
			{
				IPHostEntry hostEntry = Dns.GetHostEntry("localhost");
				IPAddress iPAddress = hostEntry.AddressList[0];
				IPEndPoint remoteEndPoint = new IPEndPoint(iPAddress, 53456);

				Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

				try
				{
					socket.Connect(remoteEndPoint);

					Console.WriteLine("Connecting ...");

					Console.WriteLine("Input message: ");
					string message = Console.ReadLine();

					int sendBytes = socket.Send(Encoding.UTF8.GetBytes($"{message}<Plus>"));
					Console.WriteLine($"Sent {sendBytes} bytes to server");

					byte[] data = new byte[300];
					int receiveBytes = socket.Receive(data);

					Console.WriteLine($"Answer: {Encoding.UTF8.GetString(data, 0, receiveBytes)}");
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
