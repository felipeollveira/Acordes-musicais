import 'package:flutter/material.dart';
import '../../controller/process.dart';

class AcordesEscolhidos extends StatefulWidget {
  final String acordes;
 

  AcordesEscolhidos({required this.acordes});

  @override
  _AcordesEscolhidosState createState() => _AcordesEscolhidosState();
}

class _AcordesEscolhidosState extends State<AcordesEscolhidos> {
  List<int> notacaoMusical = [];
   Color corFundo = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    List<String> notasAcorde = campoHarmonico(widget.acordes.isEmpty ? 'C' : widget.acordes);
  String acordeEscolhido = widget.acordes.isEmpty ? 'C' : widget.acordes;



    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Campo harmônico de $acordeEscolhido',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
               color: Color.fromRGBO(86, 86, 86, 1),
            ),
            textAlign: TextAlign.right,
          ),
        ),

      
             SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
      spacing: 4.0,
      runSpacing: 0.0,
      children: notasAcorde.map((nota) {
        return ElevatedButton(
          onPressed: () {
            int posicaoNota = notasAcorde.indexOf(nota);
            setState(() {
              notacaoMusical.add(posicaoNota);
            });
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            backgroundColor:Color.fromARGB(255, 19, 19, 19),
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
      ),
      
              SizedBox(height: 10),
         Container(

  width: 400,
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 19, 19, 19),
    borderRadius: BorderRadius.circular(10),
  ),
  padding: EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
   children: [
    const Text(
      'Notação musical',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(86, 86, 86, 1),
      ),
    ),
    
    const SizedBox(height: 5),
    
   GestureDetector(
    
  onTap: () {
    setState(() {
      
      corFundo = Colors.red;
    });
  },
  child: Padding(
    padding: const EdgeInsets.all(0.0),
    child: Text(
      '${notacaoMusical.map((index) => notasAcorde[index]).join("    -    ")}',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      
      ),
    ),
    
  ),
  
),


    Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            notacaoMusical.clear();
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        child: const Text(
          'Reiniciar',
          style: TextStyle(
            color: Color.fromRGBO(6, 68, 107, 1),
          ),
        ),
      ),
    ),
  ],
  ),
),

              
      
            ],
          ),
        ),
      ),
    );
  }
}
