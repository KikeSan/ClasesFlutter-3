import 'package:Band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus:',style: TextStyle(fontSize: 34)),
            SizedBox(height: 15,),
            Text('${socketService.serverStatus}', style: TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}