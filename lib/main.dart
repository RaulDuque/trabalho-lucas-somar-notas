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
  const HomePage({ Key? key }): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController notaAController = TextEditingController();
  TextEditingController notaBController = TextEditingController();
  TextEditingController notaCController = TextEditingController();
  TextEditingController notaDController = TextEditingController();
  String resultadoFinal = "";

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
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/graduate.png',
                height: 82,
                width: 82,
              ),
              SizedBox(height: 48),

              buildTextFormField("Nota 1", notaAController, 10),
              SizedBox(height: 24),

              buildTextFormField("Nota 2", notaBController, 20),
              SizedBox(height: 24),

              buildTextFormField("Nota 3", notaCController, 40),
              SizedBox(height: 24),

              buildTextFormField("Nota 4", notaDController, 30),
              SizedBox(height: 48),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF2A428C),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                ),
                child: Text(
                  'Calcular nota final',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    somar();
                  }
                },
              ),

              if (resultadoFinal.isNotEmpty) ...[
                SizedBox(height: 24),
                Text(
                  resultadoFinal,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, TextEditingController controller, int notaMax) {
    return TextFormField(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'É necessário informar a nota';
        }

        double? v = double.tryParse(value);

        if (v == null) {
          return 'É necessário informar um valor numérico';
        }

        if (v < 0) {
          return 'A nota não poder ser menor que 0';
        }

        if (v > notaMax) {
          return 'A nota não pode ser maior que $notaMax';
        }

        return null;
      },
    );
  }

  void somar() {
    double notaA = double.parse(notaAController.text);
    double notaB = double.parse(notaBController.text);
    double notaC = double.parse(notaCController.text);
    double notaD = double.parse(notaDController.text);
    double total = notaA + notaB + notaC + notaD;

    setState(() {
      if (total < 40) {
        resultadoFinal = 'Você está no conceito D (${total.toStringAsPrecision(4)})';
      } else if (total < 60) {
        resultadoFinal = 'Você está no conceito C (${total.toStringAsPrecision(4)})';
      } else if (total < 80) {
        resultadoFinal = 'Você está no conceito B (${total.toStringAsPrecision(4)})';
      } else if (total <= 100) {
        resultadoFinal = 'Você está no conceito A(${total.toStringAsPrecision(4)})';
      }
    });
  }
}
