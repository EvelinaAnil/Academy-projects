using System;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace SocketUdpClient
{
	class Program
    {
        static void Main(string[] args)
        {
			try
			{
				IPAddress iPAddress = IPAddress.Loopback; // 127.0.0.1

				Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Dgram, ProtocolType.Udp);

				try
				{
					socket.Bind(new IPEndPoint(iPAddress, 51001));

					Console.WriteLine("Input message:");

					socket.SendTo(Encoding.UTF8.GetBytes(Console.ReadLine()), new IPEndPoint(IPAddress.Parse("127.0.0.1"), 53415));

					byte[] buffer = new byte[1000];
					EndPoint endPoint = new IPEndPoint(IPAddress.Any, 0);
					int readBytes = socket.ReceiveFrom(buffer, ref endPoint);

					Console.WriteLine($"Received: {Encoding.UTF8.GetString(buffer, 0, readBytes)}");
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
