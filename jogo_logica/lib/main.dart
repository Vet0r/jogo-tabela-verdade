import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_logica/custom_theme.dart';
import 'package:jogo_logica/dificuldades.dart';
import 'package:jogo_logica/jogo.dart';

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
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Text('Jerry'),
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
    borderRadius: BorderRadius.circular(8.0), // Raio dos cantos da borda
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
            'assets/icons/gema.png', // Caminho para a imagem
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Fácil',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 70)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0), // Espaço entre o texto e a barra de progresso
              Container(
                width: MediaQuery.of(context).size.width * 0.67, // Largura da barra de progresso
                height: 25.0,
                decoration: BoxDecoration(
                  color: Colors.grey[700], // Cor de fundo da barra
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0, // Proporção do progresso (0.0 a 1.0)
                      child: Container(
                        decoration: BoxDecoration(
                          color: fontPrincipal, // Cor da parte preenchida da barra
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '10/10', // Texto dentro da barra de progresso
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          
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
    borderRadius: BorderRadius.circular(8.0), // Raio dos cantos da borda
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
            'assets/icons/cristal.png', // Caminho para a imagem
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Médio',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 70)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0), // Espaço entre o texto e a barra de progresso
              Container(
                width: MediaQuery.of(context).size.width * 0.67, // Largura da barra de progresso
                height: 25.0,
                decoration: BoxDecoration(
                  color: Colors.grey[700], // Cor de fundo da barra
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0, // Proporção do progresso (0.0 a 1.0)
                      child: Container(
                        decoration: BoxDecoration(
                          color: fontPrincipal, // Cor da parte preenchida da barra
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '10/10', // Texto dentro da barra de progresso
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          
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
    borderRadius: BorderRadius.circular(8.0), // Raio dos cantos da borda
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
            'assets/icons/diamante.png', // Caminho para a imagem
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Complete o Nível Difícil',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: 70)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
              SizedBox(height: 10.0), // Espaço entre o texto e a barra de progresso
              Container(
                width: MediaQuery.of(context).size.width * 0.67, // Largura da barra de progresso
                height: 25.0,
                decoration: BoxDecoration(
                  color: Colors.grey[700], // Cor de fundo da barra
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0, // Proporção do progresso (0.0 a 1.0)
                      child: Container(
                        decoration: BoxDecoration(
                          color: fontPrincipal, // Cor da parte preenchida da barra
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '10/10', // Texto dentro da barra de progresso
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          
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
