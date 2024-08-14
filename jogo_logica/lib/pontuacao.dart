import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jogo_logica/custom_theme.dart';

import 'main.dart';

class PontuacaoScreen extends StatelessWidget {
  PontuacaoScreen({super.key, required this.pontuacao});
  int pontuacao = 0;
  TextEditingController controller = TextEditingController();
  List<String> phases = [
    "Continue praticando para melhorar ainda mais!",
    'Você acertou a maioria das questões!',
    'Você acertou todas as questões!'
  ];
  List<String> images = [
    'assets/viking.png',
    'assets/chapeu.png',
    'assets/coroa.png'
  ];
  @override
  Widget build(BuildContext context) {
    int imagesAndPhase = 0;
    if (pontuacao >= 10) {
      imagesAndPhase = 2;
    } else if (pontuacao > 5 && pontuacao < 10) {
      imagesAndPhase = 1;
    } else {
      imagesAndPhase = 0;
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageTop(images[imagesAndPhase], phases[imagesAndPhase]),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    square(context),
                    square(context),
                    square(context),
                  ],
                ),
                square(context)
                // Center(
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => const MyHomePage(),
                //         ),
                //       );
                //     },
                //     child: const Text("Confirmar"),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageTop(String image, String phase) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Você está indo bem!',
          style: TextStyle(
              color: fontPrincipal,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              fontFamily: 'Quicksand'),
        ),
        Text(
          phase,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Quicksand'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Image.asset(image),
      ],
    );
  }
}

square(BuildContext context) {
  return Center(
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          width: 3,
          color: Colors.green,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(),
    ),
  );
}
