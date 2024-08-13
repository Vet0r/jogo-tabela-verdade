
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/pontuacao.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
      backgroundColor: backgroundColor,
     appBar:AppBar(
  automaticallyImplyLeading: false, 
  backgroundColor: Colors.transparent,
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white, size: 24,),
            onPressed: () {
              
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.53,
              animation: true,
              lineHeight: 25.0,
              animationDuration: 2500,
              percent: 0.1,
              center: Text(
                "1/10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: fontPrincipal,
              backgroundColor: embaixoBorda,
              barRadius: Radius.circular(14),
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icons/estrela.png'),
              SizedBox(width: 10),
              Text(
                "$pontuacao",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Row(
            children: [
              Image.asset('assets/icons/relogio.png'),
              SizedBox(width: 10),
              Text(
                "$_start",
                style: TextStyle(
                  color: CorDoRelogio,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
),
      body: Column(
        children: [
          Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Text('Verifique a proposição!',style: TextStyle(color: fontPrincipal, fontSize: 32,fontWeight: FontWeight.w600, fontFamily: 'Quicksand'),),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text("Leia a sentença abaixo e selecione\nVerdadeira ou Falso.",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Quicksand')),],),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
          Expanded(
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 200, 
              width: 200, 
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Bordas quadradas
                      side: BorderSide(color: Colors.green, width: 1.0), // Borda verde
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)), // Tamanho mínimo
                ),
                onPressed: () {
                  setState(() {
                    resp = true;
                  });
                },
                child: Center(
                  child: Text(
                    "Verdadeiro",
                    style: TextStyle(color: Colors.white), // Texto verde
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
         
          Expanded(
            child: SizedBox(
              height: 200, 
              width: 200, 
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, 
                      side: BorderSide(color: Colors.red, width: 1.0), 
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)), // Tamanho mínimo
                ),
                onPressed: () {
                  setState(() {
                    resp = false;
                  });
                },
                child: Center(
                  child: Text(
                    "Falso",
                    style: TextStyle(color: Colors.white), 
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(CorDoBotao)),
                  onPressed: () {
                    if (_start > 0) {
                      responder();
                    }
                  },
                  child: Center(
                    child: Text("PRÓXIMO",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),);
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