import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
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
        title: Text("Culadora de notas "),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0800FF),
                Color(0xFF0785E9),
                Color(0xFF00FF36),
              ],
            ),
          ),
        ),
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
