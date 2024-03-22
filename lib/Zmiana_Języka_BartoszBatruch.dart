import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/ustawienia.dart';
import 'language.dart';
import 'MartynaLeman.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      debugShowCheckedModeBanner: false,
      theme: Themeslist().themeses[themeIndex],
      home: const MyHomePage(title: 'Zmiana Języka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Ustawienia()),
            );
          },
        ),
        title: Text(AppLocalization.getTranslatedValue("Language Changer")),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('en');
                  },
                  child: Text(AppLocalization.getTranslatedValue('English(English)'), style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('pl');
                  },
                  child: Text(AppLocalization.getTranslatedValue('Polish(Polski)'), style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('de');
                  },
                  child: Text(AppLocalization.getTranslatedValue('German(Deutsch)'), style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('ru');
                  },
                  child: Text(AppLocalization.getTranslatedValue('Russian(Русский)'), style: TextStyle(fontSize: 18.0)),
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Container(
                width: 370,
                height: 90,
                child: ElevatedButton(
                  onPressed: () {
                    _incrementCounter;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstRoute()),
                    );
                  },
                  child: Text(AppLocalization.getTranslatedValue('Apply'), style: TextStyle(fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
