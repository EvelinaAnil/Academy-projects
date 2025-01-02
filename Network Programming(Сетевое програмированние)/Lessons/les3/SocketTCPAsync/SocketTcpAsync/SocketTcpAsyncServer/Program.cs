using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SocketTcpAsyncServer
{
    class State
    {
        public Socket Socket { get; set; }
        public byte[] Buffer { get; set; }
        public StringBuilder Data { get; set; }
    }

    class Program
    {
        private static ManualResetEvent _manualReset;

        static Program()
        {
            _manualReset = new ManualResetEvent(false);
        }

        static void Main(string[] args)
        {
            try
            {
                IPAddress iPAddress = IPAddress.Parse("127.0.0.1");
                IPEndPoint localEndPoint = new IPEndPoint(iPAddress, 56432);

                Socket socket = new Socket(iPAddress.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

                try
                {
                    socket.Bind(localEndPoint);
                    socket.Listen(3);

                    while (true)
                    {
                        _manualReset.Reset();

                        Console.WriteLine("Waiting ...");

                        socket.BeginAccept(AcceptCallback, socket);

                        _manualReset.WaitOne();
                    }
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

        private static void AcceptCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is Socket socket)
                {
                    Socket acceptSocket = socket.EndAccept(ar);

                    State state = new State
                    {
                        Socket = acceptSocket,
                        Buffer = new byte[100],
                        Data = new StringBuilder()
                    };

                    acceptSocket.BeginReceive(state.Buffer, 0, state.Buffer.Length, SocketFlags.None, ReceiveCallback, state);
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
                    Socket socket = state.Socket;

                    int readBytes = socket.EndReceive(ar);

                    if (readBytes > 0)
                    {
                        state.Data.Append(Encoding.UTF8.GetString(state.Buffer, 0, readBytes));

                        if (state.Data.ToString().Contains("<TheEnd>"))
                        {
                            Console.WriteLine($"Read {state.Data.Length} bytes.\nData: {state.Data}");

                            byte[] data = Encoding.UTF8.GetBytes("Message received");
                            socket.BeginSend(data, 0, data.Length, SocketFlags.None, SendCallback, socket);
                        }
                        else
                        {
                            socket.BeginReceive(state.Buffer, 0, state.Buffer.Length, SocketFlags.None, ReceiveCallback, state);
                        }
                    }
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
                    Console.WriteLine($"Sent {socket.EndSend(ar)} bytes to client.");

                    socket.Shutdown(SocketShutdown.Both);
                    socket.Close();

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
