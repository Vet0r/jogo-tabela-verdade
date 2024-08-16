import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/provider/shared_prefs_provider.dart';
import 'package:provider/provider.dart';

import 'main.dart';

// ignore: must_be_immutable
class PontuacaoScreen extends StatelessWidget {
  PontuacaoScreen(
      {super.key,
      required this.pontuacao,
      required this.respondidas,
      required this.modDif});
  int respondidas = 0;
  int modDif = 1;
  int pontuacao = 0;

  TextEditingController controller = TextEditingController();
  List<String> phasesBottom = [
    "Continue praticando para melhorar ainda mais!",
    'Você acertou a maioria das questões!',
    'Você acertou todas as questões!'
  ];
  List<String> phasesTop = [
    "Você está indo bem!",
    'Ótimo trabalho!',
    'Excelente trabalho!'
  ];
  List<String> images = [
    'assets/viking.png',
    'assets/chapeu.png',
    'assets/coroa.png'
  ];
  @override
  Widget build(BuildContext context) {
    int? pontosAtuais =
        Provider.of<SnapshotSharedPreferences>(context, listen: false)
            .sharedPrefs!
            .getInt('pontos');
    if (pontosAtuais == null) {
      Provider.of<SnapshotSharedPreferences>(context, listen: false)
          .sharedPrefs!
          .setInt('pontos', pontuacao);
    } else {
      Provider.of<SnapshotSharedPreferences>(context, listen: false)
          .sharedPrefs!
          .setInt('pontos', pontuacao + pontosAtuais);
    }
    var sharedPrefs =
        Provider.of<SnapshotSharedPreferences>(context, listen: false)
            .sharedPrefs;
    switch (modDif) {
      case 1:
        int pontos = sharedPrefs!.getInt('nFac') ?? 0;
        if (pontos >= 10) {
          sharedPrefs.setInt('nFac', pontos += 1);
        } else {
          null;
        }
        break;
      case 3:
        int pontos = sharedPrefs!.getInt('nMed') ?? 0;
        if (pontos >= 10) {
          sharedPrefs.setInt('nMed', pontos += 1);
        } else {
          null;
        }
        break;
      case 5:
        int pontos = sharedPrefs!.getInt('nDif') ?? 0;
        if (pontos >= 10) {
          sharedPrefs.setInt('nDif', pontos += 1);
        } else {
          null;
        }
        break;
      default:
    }
    double media = (((pontuacao / modDif) / respondidas) * 100);
    int imagesAndPhase = 0;
    if (media >= 100 && (pontuacao / modDif) >= 10) {
      imagesAndPhase = 2;
    } else if (media > 50 && media < 100) {
      imagesAndPhase = 1;
    } else {
      imagesAndPhase = 0;
    }
    int sec = (pontuacao + 15) % 60;
    int min = ((pontuacao + 15) / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pageTop(context, images[imagesAndPhase],
                      phasesBottom[imagesAndPhase], phasesTop[imagesAndPhase]),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      square(
                        context,
                        corAmarelo,
                        'Total XP',
                        'assets/icons/raio.svg',
                        '$pontuacao',
                      ),
                      square(
                        context,
                        corAzul,
                        'Tempo',
                        'assets/icons/relogio.svg',
                        '$minute:$second',
                      ),
                      square(
                        context,
                        corVerde,
                        'Precisão',
                        'assets/icons/alvo.svg',
                        '${media.toStringAsFixed(0) == 'NaN' ? 0 : media.toStringAsFixed(0)}%',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(color: CorDoBotao, width: 1.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(backgroundColor2)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Voltar para o início",
                        style: TextStyle(color: CorDoBotao),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pageTop(
      BuildContext context, String image, String phaseBottom, String phaseTop) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          phaseTop,
          style: TextStyle(
              color: fontPrincipal,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              fontFamily: 'Quicksand'),
        ),
        Text(
          phaseBottom,
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
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ],
    );
  }
}

square(BuildContext context, Color cor, String texto, String asset,
    String numero) {
  return Center(
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          width: 3,
          color: cor,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            texto,
            style: TextStyle(
              color: backgroundColor2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              border: Border.all(
                width: 3,
                color: backgroundColor2,
                style: BorderStyle.solid,
              ),
            ),
            height: 70,
            width: MediaQuery.of(context).size.width * .23,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(asset),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    numero,
                    style: TextStyle(
                      color: cor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
