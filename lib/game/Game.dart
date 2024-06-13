import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imageApp = const AssetImage("images/padrao.png");
  final _msgAppChoice = "Escolha do App";
  var _msg = "Escolha uma opção abaixo";
  var _result = "";

  void _imageSelected(String data) {
    var options = ["pedra", "papel", "tesoura"];
    var randomNumber = Random().nextInt(options.length);
    var appChoice = options[randomNumber];
    if (
      (data == "pedra" && appChoice == "tesoura") ||
      (data == "tesoura" && appChoice == "papel") ||
      (data == "papel" && appChoice == "pedra")
    ) {
      _result = "Parabéns, você ganhou!";
    } else if (data == appChoice) {
      _result = "Empatamos!";
    } else {
      _result = "Você perdeu!";
    }
    setState(() {
      _imageApp = AssetImage("images/$appChoice.png");
      _msg = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _msgAppChoice,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Image(image: _imageApp),
          Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () => _imageSelected("pedra"),
                child: Image.asset("images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _imageSelected("papel"),
                child: Image.asset("images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _imageSelected("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100,),
              )
            ],
          )
        ],
      ),
    );
  }
}
