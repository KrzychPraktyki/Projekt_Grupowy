import 'package:flutter/material.dart';
import 'MartynaLeman.dart';

class Ustawienia extends StatelessWidget {
  const Ustawienia({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(color:Colors.orange,fontSize: 25));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ustawienia'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DrugaStrona()),
                    );
                  },
                  child: const Text('Motyw'),
                ),
                const SizedBox(
                  height: 20.0,
                ),


              ]
          )
      ),
    );
  }
}