import 'package:flutter/material.dart';
import 'views/partials/acordes_listview.dart';
import 'views/partials/acordes_escolhidos.dart';
import 'controller/process.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.black;
  String acordeSelecionado = '';

  final List<String> acordes = [
    'C', 'C#', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'Ab', 'A', 'B', 'Bb'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 12, 12),
      appBar: AppBar(
        title: const Text(
          'Acordes musicais app',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 49, 82),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 0),
              child: AcordesListView(
                acordes: acordes,
                backgroundColor: backgroundColor,
                onPressed: (acordeSelecionado) {
                  setState(() {
                    // Faça algo com o acorde selecionado, se necessário
                    print('Acorde selecionado: $acordeSelecionado');
                    //backgroundColor = Color.fromARGB(255, 0, 224, 165);
                    this.acordeSelecionado = acordeSelecionado; 
                  });
                },
              ),
            ),
   
            AcordesEscolhidos(acordes: acordeSelecionado),
          ],
        ),
      ),
    );
  }
}
