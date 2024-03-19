///    login.dart jest teraz plikiem głównym , który powinien być plikiem uruchamiającym

import 'package:flutter/material.dart';
import 'Danylo Kochurov.dart';
import 'BartoszBatruch.dart';
import 'KrzysztofGieresz.dart';
import 'ustawienia.dart';
import 'systemyliczb_ArturZaborowski.dart';
import 'probability_arturzaborowski.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strona Główna'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ustawienia()),
                    );
                  },
                  child: const Text('Ustawienia', style: TextStyle(fontSize: 22.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TrzeciaStrona()),
                    );
                  },

                  child: const Text('Menedżer zadań', style: TextStyle(fontSize: 22.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NumberConverter()),
                    );
                  },

                  child: const Text('Systemy Liczb', style: TextStyle(fontSize: 22.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CzwartaStrona()),
                    );
                  },
                  child: const Text('Przelicznik jednostek', style: TextStyle(fontSize: 22.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CalorieTracker()),

                    );
                  },
                  child: const Text('Kalkulator kalorii', style: TextStyle(fontSize: 22.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProbabilityCalc()),

                    );
                  },
                  child: const Text('Kalkulator prawdopodobieńśtwa', style: TextStyle(fontSize: 22.0)),
                ),
              ),

            ],
          )
      ),
    );
  }
}