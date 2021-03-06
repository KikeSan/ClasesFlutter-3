import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;
  get serverStatus => this._serverStatus;
  SocketService(){ this._initConfig(); }

  void _initConfig(){
    IO.Socket socket = IO.io('http://192.168.0.18:3001',{
      'transports': ['websocket'],
      'autoConnect': true
    });
    socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
      print('connect');
    });
    socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
      print('disconnect');
    });

    socket.on('nuevo-mensaje',(payload){
      print('nuevo mensaje:');
      print('nombre: '+payload['nombre']);
      print('mensaje: '+payload['mensaje']);
      print(payload.containsKey('mensaje2') ? payload['mensaje2']: 'No hay');
    });


    print('Pasé por los sockets');
    //socket.on('event', (data) => print(data));
    //socket.onDisconnect((_) => print('disconnect'));
  }
}