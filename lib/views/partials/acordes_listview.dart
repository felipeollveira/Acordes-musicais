import 'package:flutter/material.dart';
import 'acordes_escolhidos.dart';

class AcordesListView extends StatelessWidget {
  
  final List<String> acordes;
  final Color backgroundColor;
  final Function(String) onPressed;

  const AcordesListView({
    Key? key,
    required this.acordes,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            transform: Matrix4.translationValues(10.0, 2.0, 0.0),
            child: const Text(
              'Qual nota adjacente?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: acordes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onPressed(acordes[index]); // Envie o acorde escolhido como parâmetro
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:  Color.fromARGB(255, 19, 19, 19),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        acordes[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
