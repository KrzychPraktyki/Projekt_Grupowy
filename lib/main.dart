///    login.dart jest teraz plikiem głównym , który powinien być plikiem uruchamiającym
import 'package:flutter/material.dart';
import 'package:untitled/login.dart';
import 'Danylo Kochurov.dart';
import 'BartoszBatruch.dart';
import 'KrzysztofGieresz.dart';
import 'ustawienia.dart';
import 'systemyliczb_ArturZaborowski.dart';
import 'probability_arturzaborowski.dart';
import 'language.dart';
import 'MartynaLeman.dart';

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
            leading: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
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
                      child: Text(AppLocalization.getTranslatedValue('Settings'), style: TextStyle(fontSize: 18.0)),
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

                      child: Text(AppLocalization.getTranslatedValue('Task Manager'), style: TextStyle(fontSize: 18.0)),
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

                      child: Text(AppLocalization.getTranslatedValue('Number Systems'), style: TextStyle(fontSize: 18.0)),
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
                      child: Text(AppLocalization.getTranslatedValue('Przelicznik jednostek'), style: TextStyle(fontSize: 18.0)),
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
                      child:Text(AppLocalization.getTranslatedValue('Kalkulator kalorii'), style: TextStyle(fontSize: 18.0)),
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
                      child: Text(AppLocalization.getTranslatedValue('Kalkulator prawdopodobieńśtwa'), style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center),
                    ),
                  ),

                ],
              )
          ),
        ));

  }
}