import 'package:flutter/material.dart';
import 'MartynaLeman.dart';
import 'language.dart';
import 'Zmiana_Języka_BartoszBatruch.dart';
import 'main.dart';

class Ustawienia extends StatelessWidget {
  const Ustawienia({super.key});


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(color:Colors.orange,fontSize: 25));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()),
                );
              },
            ),
            title: Text(AppLocalization.getTranslatedValue('Settings')),
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
                        child: Text(AppLocalization.getTranslatedValue('Motive'), style: TextStyle(fontSize: 18.0)),
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
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Text(AppLocalization.getTranslatedValue('Language'), style: TextStyle(fontSize: 18.0)),
                      ),
                    ),
                    const SizedBox (
                      height: 20.0,
                    ),

                  ]
              )
          ),
        ));

  }
}