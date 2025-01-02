using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SocketServerAsync
{
    class State
    {
        public Socket Socket { get; set; }
        public byte[] Buffer { get; set; }
    }
    class Program
    {
        private static EndPoint _clientEndPoint;
        private static ManualResetEvent _manualReset;

        static Program()
        {
            _clientEndPoint = new IPEndPoint(IPAddress.Any, 0);
            _manualReset = new ManualResetEvent(false);
        }

        static void Main(string[] args)
        {
            try
            {
                IPAddress iPAddress = IPAddress.Parse("127.0.0.1");
                IPEndPoint iPEndPoint = new IPEndPoint(iPAddress, 23415);

                Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Dgram, ProtocolType.Udp);
                try
                {
                    socket.Bind(iPEndPoint);

                    State state = new State
                    {
                        Socket = socket,
                        Buffer = new byte[1024]
                    };

                    Console.WriteLine("Waiting ...");

                    _manualReset.Reset();

                    socket.BeginReceiveFrom(state.Buffer, 0, state.Buffer.Length, SocketFlags.None, ref _clientEndPoint, ReceiveCallback, state);

                    _manualReset.WaitOne();
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

        private static void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is State state)
                {
                    Socket client = state.Socket;

                    int readBytes = client.EndReceiveFrom(ar, ref _clientEndPoint);
                    IPAddress clientIPAddress = (_clientEndPoint as IPEndPoint).Address;

                    Console.WriteLine($"Received from {clientIPAddress}:\n\n\t{Encoding.Unicode.GetString(state.Buffer, 0, readBytes)}");

                    byte[] answer = Encoding.Unicode.GetBytes("Hello UDP");
                    client.BeginSendTo(answer, 0, answer.Length, SocketFlags.None, _clientEndPoint, SendCallback, client); 
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        private static void SendCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is Socket socket)
                {
                    socket.EndSend(ar);

                    _manualReset.Set();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}