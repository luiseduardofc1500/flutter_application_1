import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(title: "Contador de pessoas", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Seja bem vindo!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      _pessoaTotal += -1 * delta;
      if (_pessoa >= 20) {
        _mensagem = "Estamos lotados, desculpe";
        _pessoa = 20;
        isButton1Active = false;
      } else if (_pessoa < 20 && _pessoa > 0) {
        _mensagem = "Pode entrar!";
        isButton1Active = true;
        isButton2Active = true;
      } else {
        isButton2Active = false;
        _pessoa = 0;
      }
    });
  }

  void _mesesDisponiveis() {
    setState(() {
      _mensagem = "Nosso restaurante ainda possui: $_pessoaTotal vagas.";
    });
  }

  int _pessoaTotal = 20;
  bool isButton1Active = true;
  bool isButton2Active = false;

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "Imagens/wp1874155.webp",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_pessoa",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ), //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.amber,
                      onSurface: Colors.amber,
                    ),
                    onPressed: isButton1Active
                        ? () {
                            _changePeople(1);
                          }
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.amber,
                      onSurface: Colors.amber,
                    ),
                    onPressed: isButton2Active
                        ? () {
                            _changePeople(-1);
                          }
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "Disponiveis",
                      style: TextStyle(fontSize: 28.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.amber,
                      onSurface: Colors.amber,
                    ),
                    onPressed: _mesesDisponiveis,
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ) //text
          ], //widget
        ) //Column
      ],
    );
  }
}
