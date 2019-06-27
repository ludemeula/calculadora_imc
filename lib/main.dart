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
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.person_outline, size: 70),
              new Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      helperText: 'Insira o Peso (kg)',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              new Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      helperText: 'Insira a Altura (cm)',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('Calcular'),
          ),
        ],
      ),
    );
  }
}
