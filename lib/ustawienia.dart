import 'package:flutter/material.dart';
import '1_ArturZaborowski.dart';
import 'MartynaLeman.dart';

class Ustawienia extends StatelessWidget {
  const Ustawienia({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(color:Colors.orange,fontSize: 30));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strona Główna'),
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
                      MaterialPageRoute(builder: (context) => const PierwszaStrona()),
                    );
                  },
                  child: const Text('Język'),
                ),
          const SizedBox(
              height: 20.0,),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DrugaStrona(title: 'Motywy')),
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

