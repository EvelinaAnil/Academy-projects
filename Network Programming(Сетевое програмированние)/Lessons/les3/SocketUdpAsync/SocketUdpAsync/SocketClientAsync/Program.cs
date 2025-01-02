using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SocketClientAsync
{
    class State
    {
        public Socket Socket { get; set; }
        public byte[] Buffer { get; set; }
    }
    class Program
    {
        private static EndPoint _serverEndPoint;
        private static ManualResetEvent _sendManual;
        private static ManualResetEvent _receiveManual;

        static Program()
        {
            _serverEndPoint = new IPEndPoint(IPAddress.Any, 0);
            _sendManual = new ManualResetEvent(false);
            _receiveManual = new ManualResetEvent(false);
        }

        static void Main(string[] args)
        {
            try
            {
                IPAddress iPAddress = IPAddress.Parse("127.0.0.1");
                IPEndPoint iPEndPoint = new IPEndPoint(iPAddress, 11122);

                Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Dgram, ProtocolType.Udp);
                try
                {
                    socket.Bind(iPEndPoint);

                    Console.WriteLine("Input message:");

                    byte[] data = Encoding.Unicode.GetBytes(Console.ReadLine());
                    socket.BeginSendTo(data, 0, data.Length, SocketFlags.None, new IPEndPoint(IPAddress.Parse("127.0.0.1"), 23415), SendCallback, socket);

                    _sendManual.WaitOne();

                    State state = new State
                    {
                        Socket = socket,
                        Buffer = new byte[1024]
                    };
                    socket.BeginReceiveFrom(state.Buffer, 0, state.Buffer.Length, SocketFlags.None, ref _serverEndPoint, ReceiveCallback, state);

                    _receiveManual.WaitOne();
                }
                finally
                {
                    socket?.Shutdown(SocketShutdown.Send);
                    socket?.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadKey();
        }

        private static void SendCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is Socket socket)
                {
                    Console.WriteLine($"Send {socket.EndSend(ar)} bytes to server");

                    _sendManual.Set();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is State state)
                {
                    Socket client = state.Socket;

                    int readBytes = client.EndReceiveFrom(ar, ref _serverEndPoint);
                    IPAddress clientIPAddress = (_serverEndPoint as IPEndPoint).Address;

                    Console.WriteLine($"Received from {clientIPAddress}:\n\n\t{Encoding.Unicode.GetString(state.Buffer, 0, readBytes)}");

                    _receiveManual.Set(); 
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}