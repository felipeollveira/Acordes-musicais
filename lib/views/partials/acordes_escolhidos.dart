import 'package:flutter/material.dart';
import '../../controller/process.dart';

class AcordesEscolhidos extends StatelessWidget {
  final String acordes;


  AcordesEscolhidos({required this.acordes});

  @override
  Widget build(BuildContext context) {

  List<String> notasAcorde = campoHarmonico(acordes.isEmpty ? 'C' : acordes);
  String acordeEscolhido = '';

  if(acordes.isEmpty) acordeEscolhido = 'C';
  else acordeEscolhido = acordes;


   return SizedBox(
  child: Container(
       padding: EdgeInsets.all(20),
  
  
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Campo harmônico de $acordeEscolhido',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right, 
         
        ),
        Wrap(
          spacing: 2.0, // Espaçamento entre os botões
          runSpacing: 0.0, // Espaçamento entre as linhas de botões
          children: notasAcorde.map((nota) {
            return ElevatedButton(
              onPressed: () {
                // Faça algo quando o botão for pressionado
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0), // Espaçamento interno do botão
                backgroundColor: Color.fromARGB(255, 26, 26, 26), // Cor do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                nota,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  ),
);

  }
}
