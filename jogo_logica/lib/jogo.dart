import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/pontuacao.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'dificuldades.dart';

// ignore: must_be_immutable
class Jogar extends StatefulWidget {
  Jogar({super.key, required this.dificuldade, required this.modDif});
  List<Questao> dificuldade = [];
  int modDif;
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
  int respondidas = 0;
  int _start = 15;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: LinearPercentIndicator(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'Verifique a proposição!',
                style: TextStyle(
                    color: fontPrincipal,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quicksand'),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Column(
            children: [
              Text(
                widget.dificuldade[numero].pergunta,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Image.asset(
                numero.isEven
                    ? 'assets/icons/homem.png'
                    : 'assets/icons/bow.png',
                width: MediaQuery.of(context).size.width * .4,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    botaoVerdadeOuFalso(
                      'assets/icons/verdadeiro.png',
                      true,
                      Colors.green,
                      "Verdadeiro",
                      isButtonTrue1Active,
                      1,
                    ),
                    SizedBox(width: 8),
                    botaoVerdadeOuFalso(
                      'assets/icons/falso.png',
                      false,
                      Colors.red,
                      "Falso",
                      isButtonFalse1Active,
                      2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.08,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        side: BorderSide(color: CorDoBotao, width: 2.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(CorDoBotao)),
                onPressed: () {
                  if (_start > 0) {
                    responder(widget.modDif);
                  }
                },
                child: Center(
                  child: Text(
                    "PRÓXIMO",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isButtonTrue1Active = false;
  bool isButtonFalse1Active = false;

  void toggleButtons(int buttonIndex) {
    if (buttonIndex == 1) {
      setState(() {
        isButtonTrue1Active = true;
        isButtonFalse1Active = false;
      });
    } else {
      setState(() {
        isButtonTrue1Active = false;
        isButtonFalse1Active = true;
      });
    }
  }

  botaoVerdadeOuFalso(String image, bool tof, Color borderColor, String text,
      bool active, int buttonIndex) {
    return Expanded(
      child: Container(
        height: 200,
        width: 200,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                side:
                    BorderSide(color: active ? borderColor : borda, width: 2.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(100, 100)),
          ),
          onPressed: () {
            setState(() {
              resp = tof;
              toggleButtons(buttonIndex);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              Padding(padding: EdgeInsets.only(top: 35)),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  responder(int modDif) {
    if (resp == null) {
      null;
    } else {
      if (resp == widget.dificuldade[numero].resposta) {
        pontuacao += modDif;
        _start += modDif;
      } else {
        if (pontuacao - 1 < 0) {
          null;
        } else {
          pontuacao -= modDif;
          _start -= modDif;
        }
      }
      respondidas++;
      setState(() {
        numero = Random().nextInt(10);
        isButtonTrue1Active = false;
        isButtonFalse1Active = false;
        resp = null;
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
              modDif: widget.modDif,
              pontuacao: pontuacao,
              respondidas: respondidas,
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
