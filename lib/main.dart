import 'package:flutter/material.dart';
import 'Danylo Kochurov.dart';
import 'BartoszBatruch.dart';
import 'KrzysztofGieresz.dart';
import 'ustawienia.dart';
import 'systemyliczb_ArturZaborowski.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),

    debugShowCheckedModeBanner: false,
  ));
}


class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25));
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
                MaterialPageRoute(builder: (context) => const Ustawienia()),
              );
            },
            child: const Text('Ustawienia'),
          ),
            const SizedBox(
              height: 20.0,
            ),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrzeciaStrona()),
              );
            },

              child: const Text('Menedżer zadań'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DrugaStrona()),
                );
              },

              child: const Text('Systemy Liczbowe'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CzwartaStrona()),
                );
              },
              child: const Text('Przelicznik jednostek'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalorieTracker()),

                );
              },
              child: const Text('Kalkulator kalorii'),
            ),

            ]
        )
      ),
    );
  }
}








