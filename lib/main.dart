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
  Widget buildTextFild(String label) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.blue),
      keyboardType: TextInputType.number,
    );
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/graduate.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 80),
            buildTextFild("nota 1"),
            buildTextFild("nota 2"),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text('Caucular notas'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
