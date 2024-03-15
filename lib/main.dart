import 'package:flutter/material.dart';
import '1_ArturZaborowski.dart';
import 'MartynaLeman.dart';
import 'Danylo Kochurov.dart';
import 'BartoszBatruch.dart';
import 'KrzysztofGieresz.dart';

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
              height: 20.0,
            ),
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
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TrzeciaStrona()),
                );
              },
              child: const Text('Task Manager'),
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
                  MaterialPageRoute(builder: (context) => CalorieTracker()),

                );
              },
              child: const Text('kalkulator kalorii'),
            ),

            ]
        )
      ),
    );
  }
}








