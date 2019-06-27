import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus dados!';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';

    setState(() {
      _infoText = 'Informe seus dados!';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Calculadora de IMC', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Color(0xff81b9bf),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.black),
              onPressed: _resetFields,
            ),
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_outline, size: 70),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Peso (kg)',
                        helperText: 'Insira o Peso (kg)',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira o Peso (kg)';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Altura (cm)',
                        helperText: 'Insira a Altura (cm)',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira a Altura (cm)';
                      }
                    },
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      child: Text('Calcular'),
                      color: Color(0xffb2ebf2),
                    ),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff81b9bf), fontSize: 25),
                  )
                ],
              ),
            )));
  }
}
