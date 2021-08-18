import 'package:flutter/material.dart';

class FormIMC extends StatefulWidget {
  const FormIMC({Key? key}) : super(key: key);

  @override
  _FormIMCState createState() => _FormIMCState();
}

class _FormIMCState extends State<FormIMC> {
  var imc = 0.0;

  @override
  Widget build(BuildContext context) {
    final alturaController = TextEditingController();
    final pesoController = TextEditingController();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  labelText: "Altura",
                  hintText: "centimetros"),
              controller: alturaController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.line_weight),
                  labelText: "Peso",
                  hintText: "KG"),
              controller: pesoController,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Limpar"),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow[900]),
                  onPressed: () {
                    alturaController.clear();
                    pesoController.clear();
                    setState(() {
                      imc = 0.0;
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("Calcular"),
                  onPressed: () {
                    double peso =
                        (double.tryParse(pesoController.value.text) ?? 0.0);
                    double altura =
                        double.tryParse(alturaController.value.text) ?? 0.0;

                    if (altura == 0) {
                      print("Não é possivel dividir por zero!");
                    } else {
                      setState(() {
                        imc = (peso * peso) / altura;
                      });

                      print(imc);
                    }
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (imc > 0)
                          ? Text("IMC ${imc.toStringAsFixed(2)}")
                          : Text("Digite seu altura e peso."),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
