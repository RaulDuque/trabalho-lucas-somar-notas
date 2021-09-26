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
  String infot = "informe sua nota";
  TextEditingController notaAController = TextEditingController();
  TextEditingController notaBController = TextEditingController();
  TextEditingController notaCController = TextEditingController();
  TextEditingController notaDController = TextEditingController();

  Widget buildTextFild(String label, TextEditingController s) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.number,
      controller: s,
    );
  }

  void somar() {
    double notaA = double.parse(notaAController.text);
    double notaB = double.parse(notaBController.text);
    double notaC = double.parse(notaCController.text);
    double notaD = double.parse(notaDController.text);
    double total = notaA + notaB + notaC + notaD;
    setState(() {
      if (total <= 100 && total > 79) {
        infot = 'Você está no conceito A(${total.toStringAsPrecision(4)})';
      } else if (total > 59 && total <= 79) {
        infot = 'Você está no conceito B (${total.toStringAsPrecision(4)})';
      } else if (total > 40 && total <= 59) {
        infot = 'Você está no conceito C (${total.toStringAsPrecision(4)})';
      } else if (total < 39 && total > -1) {
        infot = 'Você está no conceito D (${total.toStringAsPrecision(4)})';
      } else if (total > 100) {
        infot =
            'Os valores somados exedem o 100 (${total.toStringAsPrecision(4)})';
      } else if (total < 0) {
        infot =
            'Os valores nao podem ser menores que 0 (${total.toStringAsPrecision(4)})';
      }
    });
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
            SizedBox(height: 40),
            buildTextFild("nota 1", notaAController),
            Divider(),
            buildTextFild("nota 2", notaBController),
            Divider(),
            buildTextFild("nota 3", notaCController),
            Divider(),
            buildTextFild("nota 4", notaDController),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    'Calcular notas',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    somar();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                infot,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
