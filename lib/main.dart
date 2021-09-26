import 'package:flutter/material.dart';

/*
Faça um app que receba do usuário 4 valores que represente as notas de um aluno.
O somatório das 4 notas representa a nota final do aluno na disciplina de desenvolvimento mobile.

Esse somatório pode ser classificado em 4 conceitos:
Entre 0 e 39 (inclusive): conceito D
Entre 40 e 59 (inclusive): conceito C
Entre 60 e 79 (inclusive): conceito B
Entre 80 e 100 (inclusive): conceito A

A partir do somatório das notas seu app deve informar qual o conceito do aluno na disciplina.
*/

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String infot = "";
  TextEditingController notaAController = TextEditingController();
  TextEditingController notaBController = TextEditingController();
  TextEditingController notaCController = TextEditingController();
  TextEditingController notaDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de notas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1C2E7A),
                Color(0xFF2A428C),
                Color(0xFF3C58A0),
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
              height: 82,
              width: 82,
            ),
            SizedBox(height: 48),

            buildTextFild("Nota 1", notaAController),
            SizedBox(height: 32),

            buildTextFild("Nota 2", notaBController),
            SizedBox(height: 32),

            buildTextFild("Nota 3", notaCController),
            SizedBox(height: 32),

            buildTextFild("Nota 4", notaDController),
            SizedBox(height: 32),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF2A428C),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              ),
              child: Text(
                'Calcular nota final',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: somar,
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

  Widget buildTextFild(String label, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
      keyboardType: TextInputType.number,
      controller: controller,
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
}
