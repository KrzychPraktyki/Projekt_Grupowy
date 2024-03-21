import 'package:flutter/material.dart';
import 'language.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        useMaterial3: true,
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$_counter', style: TextStyle(color: Colors.white)),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('en');
                  },
                  child: Text ('Logowanie'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('pl');
                  },
                  child: Text ('Login'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('de');
                  },
                  child: Text ('Niemiecki(Deutsch)'),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    AppLocalization.changeLanguage('ru');
                  },
                  child: Text ('Rosyjski()'),
                ),
              ),
              Container(
                child: ElevatedButton (
                  onPressed: () {
                    _incrementCounter;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                    onChange: () {
                      _handleLanguageChanger(),
                    };
                  },
                  child: Text(AppLocalization.getTranslatedValue('Zastosuj')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _handleLanguageChanger(int? value) {
    setState(() {
      themeIndex = value!;
    });
}

