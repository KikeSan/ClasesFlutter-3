import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService(){
    print('Constructor---');
    this._initConfig();
  }

  void _initConfig(){
    print('Init configggg');
    IO.Socket socket = IO.io('http://192.168.0.18:3001',{
      'transports':['websocket'],
      'autoconnect': true
    });
    socket.onConnect((_) {
      print('connect');
    });
    //socket.on('connect', (_) => print('connect'));
    //socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
  }
}