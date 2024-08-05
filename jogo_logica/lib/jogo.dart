import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jogo_logica/pontuacao.dart';

import 'dificuldades.dart';

class Jogar extends StatefulWidget {
  Jogar({super.key, required this.dificuldade});
  List<Questao> dificuldade = [];
  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int numero = Random().nextInt(10);
  bool? resp;
  int pontuacao = 0;
  int _start = 5;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Tempo: $_start"),
                    Container(),
                    Text("Pontuação: $pontuacao"),
                  ],
                ),
                Container(),
                Text(widget.dificuldade[numero].pergunta),
                Container()
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue)),
                        onPressed: () {
                          setState(() {
                            resp = true;
                          });
                        },
                        child: Center(
                          child: Container(
                            child: Text("Verdadeiro"),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          onPressed: () {
                            setState(() {
                              resp = false;
                            });
                          },
                          child: Center(
                            child: Text("Falso"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                      if (_start > 0) {
                        responder();
                      }
                    },
                    child: Center(
                      child: Text("Confirmar"),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  responder() {
    if (resp == null) {
    } else {
      if (resp == widget.dificuldade[numero].resposta) {
        pontuacao++;
      }
      setState(() {
        numero = Random().nextInt(10);
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start < 1) {
        setState(() {
          _timer.cancel();
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PontuacaoScreen(
              pontuacao: pontuacao,
            ),
          ),
        );
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
}
