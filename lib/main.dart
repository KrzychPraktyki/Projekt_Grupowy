///    login.dart jest teraz plikiem głównym , który powinien być plikiem uruchamiającym
library;
import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'danylo_kochurov.dart';
import 'bartoszbatruch.dart';
import 'krzysztofgieresz.dart';
import 'ustawienia.dart';
import 'systemyliczb_arturzaborowski.dart';
import 'probability_arturzaborowski.dart';
import 'language.dart';
import 'martynaleman.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [ IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),],
            title: Text(AppLocalization.getTranslatedValue('Main Page')),
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
                      child: Text(AppLocalization.getTranslatedValue('Settings'), style: const TextStyle(fontSize: 18.0)),
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
                          MaterialPageRoute(builder: (context) => const TaskManager()),
                        );
                      },

                      child: Text(AppLocalization.getTranslatedValue('Task Manager'), style: const TextStyle(fontSize: 18.0)),
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
                          MaterialPageRoute(builder: (context) => const NumberConverter()),
                        );
                      },

                      child: Text(AppLocalization.getTranslatedValue('Number Systems'), style: const TextStyle(fontSize: 18.0)),
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
                      child: Text(AppLocalization.getTranslatedValue('Unit Conventer'), style: const TextStyle(fontSize: 18.0)),
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
                      child:Text(AppLocalization.getTranslatedValue('Calorie Calculator'), style: const TextStyle(fontSize: 18.0)),
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
                          MaterialPageRoute(builder: (context) => const ProbabilityCalculator()),

                        );
                      },
                      child: Text(AppLocalization.getTranslatedValue('Propability Calculator'), style: const TextStyle(fontSize: 18.0),textAlign: TextAlign.center),
                    ),
                  ),

                ],
              )
          ),
        ));

  }
}