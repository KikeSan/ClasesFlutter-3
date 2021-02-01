import 'package:Band_names/models/band.dart';
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
        onPressed: (){}),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
      title: Text(band.name),
      trailing: Text('${band.votes}'),
      onTap: (){
          print(band.name);
      },
      );
  }
}

