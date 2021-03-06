import 'dart:io';

import 'package:Band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1',name: 'Red Hot Chili Peppers', votes: 5),
    Band(id: '2',name: 'Coldplay', votes: 7),
    Band(id: '3',name: 'Magic', votes: 4),
    Band(id: '4',name: 'Queen', votes: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){},
      background: Container(
        padding: EdgeInsets.only(left: 25),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.delete, color: Colors.white,),
            SizedBox(width: 10),
            Text('Delete band', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
        title: Text(band.name),
        trailing: Text('${band.votes}'),
        onTap: (){
            print(band.name);
        },
        ),
    );
  }

  addNewBand(){
    print('???');
    final textController = new TextEditingController();

    if(!Platform.isAndroid){
      return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                  child: Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: ()=> addBandToList(textController.text)
              )
            ],
          );
        },
      );
    }
    
    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text('New Band Name'),
          content: CupertinoTextField(controller: textController),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: ()=>addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Close'),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        );
      }
    );

  }

  void addBandToList(String name){
    print('abc '+name);
    if(name.length>1){
      this.bands.add(new Band(id: DateTime.now().toString(),name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}

