using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace SocketTCPAsyncClient
{
     class Program
    {
        private static ManualResetEvent _connectManual;
        private static ManualResetEvent _sendManual;
        private static ManualResetEvent _receiveManual;

        private static byte[] _buffer;
        private static StringBuilder _builder;
        private static string _response;

        static Program()
        {
            _connectManual = new ManualResetEvent(false);
            _sendManual = new ManualResetEvent(false);
            _receiveManual = new ManualResetEvent(false);

            _buffer = new byte[256];
            _builder = new StringBuilder();

        }

        static void Main(string[] args)
        {
            // 1. connect
            // 2. send 
            // 3. receive
            try
            {
                IPAddress iPAddress = IPAddress.Parse("127.0.0.1");
                IPEndPoint remoteEndP = new IPEndPoint(iPAddress, 56432);
                    
                Socket socket= new Socket(iPAddress.AddressFamily
                    ,SocketType.Stream, ProtocolType.Tcp);

                try
                {
                    socket.BeginConnect(remoteEP:remoteEndP,callback: ConnectCallback,
                        state: socket);

                    _connectManual.WaitOne();

                    //---------------
                    Console.WriteLine("Input message:");
                    byte[] data = Encoding.UTF8.GetBytes($"{Console.ReadLine()}<TheEnd>");
                    socket.BeginSend(data,0,data.Length,SocketFlags.None,SendCallback,socket);
                    _sendManual.WaitOne();
                    //---------------


                    //---------------



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

        private static void SendCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is Socket socket)
                {
                    Console.WriteLine($"Sent {socket.EndSend(ar)} bytes to server");

                    _sendManual.Set();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //        try
        //            {
        //                if (ar.AsyncState is Socket socket)
        //                {

        //                }
        //}
        //            catch (Exception ex)
        //            {
        //    Console.WriteLine(ex.Message);
        //}
        private static void ConnectCallback(IAsyncResult ar)
        {
            try
            {
                if (ar.AsyncState is Socket socket)
                {
                    socket.EndConnect(ar);

                    Console.WriteLine("Connecting...");
                    _connectManual.Set();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
