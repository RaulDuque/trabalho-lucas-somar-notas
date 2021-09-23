import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple), home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;

  void increment() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Primeiro app"),
      ),
      body: Column(
        children: <Widget>[
          TextField(),
          TextField(),
          TextField(),
          TextField(),
          ElevatedButton(
            child: Text('Caucular notas'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
