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
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resultadoFinal = "";

  final TextEditingController notaAController = TextEditingController();
  final TextEditingController notaBController = TextEditingController();
  final TextEditingController notaCController = TextEditingController();
  final TextEditingController notaDController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    notaAController.dispose();
    notaBController.dispose();
    notaCController.dispose();
    notaDController.dispose();

    super.dispose();
  }

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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/graduate.png',
                height: 82,
                width: 82,
              ),
              SizedBox(height: resultadoFinal.isEmpty ? 48 : 32),
              if (resultadoFinal.isNotEmpty) ...[
                Text(
                  resultadoFinal,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 36),
              ],
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String label, TextEditingController controller, int notaMax) {
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
      textInputAction: TextInputAction.next,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'É necessário informar a nota';
        }

        final double? v = double.tryParse(value);

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
    final double notaA = double.parse(notaAController.text);
    final double notaB = double.parse(notaBController.text);
    final double notaC = double.parse(notaCController.text);
    final double notaD = double.parse(notaDController.text);
    final double total = notaA + notaB + notaC + notaD;

    setState(() {
      if (total < 40) {
        resultadoFinal =
            'O aluno está no conceito D, com ${total.toStringAsPrecision(4)} pontos';
      } else if (total < 60) {
        resultadoFinal =
            'O aluno está no conceito C, com ${total.toStringAsPrecision(4)} pontos';
      } else if (total < 80) {
        resultadoFinal =
            'O aluno está no conceito B, com ${total.toStringAsPrecision(4)} pontos';
      } else if (total <= 100) {
        resultadoFinal =
            'O aluno está no conceito A, com ${total.toStringAsPrecision(4)} pontos';
      }
    });
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(resultadoFinal),
        content: Text("Parabens"),
        actions: <Widget>[
          TextButton(
            child: const Text('C'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
