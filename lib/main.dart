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

  void somar() {
    count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de notas ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF00B8D4),
                Color(0xFF00E5FF),
                Color(0xFF18FFFF),
                Color(0xFF00BCD4)
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/graduate.png',
            height: 150,
            width: 150,
          ),
          TextField(
              decoration: InputDecoration(
                  labelText: " Nota 1",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20.0))),
          TextField(
              decoration: InputDecoration(
                  labelText: " Nota 2",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20.0))),
          TextField(
              decoration: InputDecoration(
                  labelText: " Nota 3",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20.0))),
          TextField(
              decoration: InputDecoration(
                  labelText: " Nota 4",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20.0))),
          ElevatedButton(
            child: Text('Caucular notas'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
