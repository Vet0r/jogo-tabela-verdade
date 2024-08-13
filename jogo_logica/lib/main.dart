import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/dificuldades.dart';
import 'package:jogo_logica/jogo.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('Jerry', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
            Image.asset('assets/icons/livro.png',
            width: MediaQuery.of(context).size.width * 0.30,
            height: MediaQuery.of(context).size.height * 0.15,),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Escolha a Dificuldade!',style: TextStyle(color: fontPrincipal, fontSize: 32,fontWeight: FontWeight.w600, fontFamily: 'Quicksand'),),
            Text("Selecione um nível de dificuldade para\ncomeçar:",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600, fontFamily: 'Quicksand')),],),
          Container(
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
            dificuldade: facil,
          ),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/gema.png', 
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(padding: EdgeInsets.only(left: 25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Fácil',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 45)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0),
             LinearPercentIndicator(
                width: MediaQuery.of(context).size.width *0.62,
                animation: true,
                lineHeight: 25.0,
                animationDuration: 2500,
                percent: 1,
                center: Text("10/10", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w500),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor:fontPrincipal ,
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
            Container(
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
            dificuldade: facil,
          ),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/cristal.png', 
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
         Padding(padding: EdgeInsets.only(left: 25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Médio',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 35)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0), 
               LinearPercentIndicator(
                width: MediaQuery.of(context).size.width *0.62,
                animation: true,
                lineHeight: 25.0,
                animationDuration: 2500,
                percent: 0.4,
                center: Text("4/10", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w500),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor:fontPrincipal ,
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
Container(
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
            dificuldade: facil,
          ),
        ),
      );
    },
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/diamante.png', 
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(padding: EdgeInsets.only(left: 25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Difícil',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 35)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0), // Espaço entre o texto e a barra de progresso
             
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width *0.62,
                animation: true,
                lineHeight: 25.0,
                animationDuration: 2500,
                percent: 0.0,
                center: Text("0/10", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w500),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor:fontPrincipal ,
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
}
