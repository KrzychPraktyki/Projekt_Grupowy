import 'package:flutter/material.dart';
import 'MartynaLeman.dart';
import 'Zmiana_Języka_BartoszBatruch.dart';
import 'language.dart';

class Ustawienia extends StatelessWidget {
  const Ustawienia({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(color:Colors.orange,fontSize: 25));
    return Scaffold(
      appBar: AppBar(
        //title: const Text(AppLocalization.getTransaltedValue('Ustawienia')),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              SizedBox(
              width: 370,
              height: 90,
              child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DrugaStrona()),
                    );
                  },
                  child: const Text('Motyw'),
                ),
              ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 370,
                  height: 90,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ZmianaJezyka()),
                      );
                    },
                    child: const Text('Język'),
                  ),
                ),


              ]
          )
      ),
    );
  }
}
