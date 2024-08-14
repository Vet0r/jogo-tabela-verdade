import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/dificuldades.dart';
import 'package:jogo_logica/jogo.dart';
import 'package:jogo_logica/provider/shared_prefs_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SnapshotSharedPreferences()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jerry',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final changeSp =
              Provider.of<SnapshotSharedPreferences>(context, listen: true);
          changeSp.changeSP(snapshot.data!);
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
                backgroundColor: backgroundColor,
                automaticallyImplyLeading: false,
                title: Text(
                  'Jerry',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/raio.svg'),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text(
                        Provider.of<SnapshotSharedPreferences>(context,
                                        listen: false)
                                    .sharedPrefs!
                                    .getInt('pontos')
                                    .toString() ==
                                'null'
                            ? '0'
                            : Provider.of<SnapshotSharedPreferences>(context,
                                    listen: false)
                                .sharedPrefs!
                                .getInt('pontos')
                                .toString(),
                        style: TextStyle(
                          color: corAmarelo,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ]),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/icons/livro.png',
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        'Escolha a Dificuldade!',
                        style: TextStyle(
                            color: fontPrincipal,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Quicksand'),
                      ),
                      Text("Selecione um nível de dificuldade para\ncomeçar:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Quicksand')),
                    ],
                  ),
                  containerDificuldade(
                      'assets/icons/gema.png', 10, "Fácil", facil, 1),
                  containerDificuldade(
                      'assets/icons/cristal.png', 4, "Médio", medio, 3),
                  containerDificuldade(
                      'assets/icons/diamante.png', 10, "Difícil", dificil, 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.leaderboard,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  containerDificuldade(String imagem, int porcentagem, String difuculdade,
      List<Questao> questoes, int modDif) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: borda,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Jogar(
                  dificuldade: questoes,
                  modDif: modDif,
                ),
              ),
            );
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagem,
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(padding: EdgeInsets.only(left: 25)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.56,
                          child: Text(
                            'Complete o Nível $difuculdade',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.66,
                      animation: true,
                      lineHeight: 25.0,
                      animationDuration: 1000,
                      percent: double.parse(porcentagem.toString()) / 10,
                      center: Text(
                        "$porcentagem/10",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: fontPrincipal,
                      backgroundColor: embaixoBorda,
                      barRadius: Radius.circular(14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
