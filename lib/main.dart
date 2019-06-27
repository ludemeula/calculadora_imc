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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 70),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    helperText: 'Insira o Peso (kg)',
                    labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    helperText: 'Insira a Altura (cm)',
                    labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Calcular'),
                  color: Color(0xffb2ebf2),
                ),
              ),
              Text(
                'Info',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffb2ebf2), fontSize: 25),
              )
            ],
          ),
        ));
  }
}
