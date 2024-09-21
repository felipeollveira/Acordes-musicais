import 'package:flutter/material.dart';
import 'acordes_escolhidos.dart';

class AcordesListView extends StatefulWidget {
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
  _AcordesListViewState createState() => _AcordesListViewState();
}

class _AcordesListViewState extends State<AcordesListView> {
  int? botaoClicado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              transform: Matrix4.translationValues(10.0, -2.0, 0.0),
              child: const Text(
                'Tom da música',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                   color: Color.fromRGBO(86, 86, 86, 1),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.acordes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            botaoClicado = index;
                          });
                          widget.onPressed(widget.acordes[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: botaoClicado == index
                              ? Color.fromRGBO(4, 41, 64, 1)
                              : Color.fromARGB(255, 19, 19, 19),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            widget.acordes[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
