import 'package:flutter/material.dart';
import 'language.dart';
import 'login.dart';


class DrugaStrona extends StatefulWidget {
  const DrugaStrona({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}
int themeIndex = 0;
class Themeslist{
  List<ThemeData> themeses = [
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade100
    ),
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink.shade100
    ),
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade100
    ),
    ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple.shade800
    ),
    ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade900
    ),
    ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade900
    ),
  ];
}


class _MyAppState extends State<DrugaStrona> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motyw',
      theme: Themeslist().themeses[themeIndex],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Motyw'),
          leading: IconButton(onPressed:(){Navigator.of(context).pop();} ,icon: const Icon(Icons.arrow_back),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile(
                title: const Text('Motyw jasny-niebieski'),
                value: 0,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw jasny-różowy'),
                value: 1,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw jasny'),
                value: 2,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw ciemny-fioletowy'),
                value: 3,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw ciemny-niebieski'),
                value: 4,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw ciemny'),
                value: 5,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
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
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Text(AppLocalization.getTranslatedValue('Zastosuj'), style: const TextStyle(fontSize: 18.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleThemeChange(int? value) {
    setState(() {
      themeIndex = value!;
    });
  }
}