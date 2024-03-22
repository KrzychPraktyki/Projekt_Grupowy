import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'language.dart';



class DrugaStrona extends StatefulWidget {
  const DrugaStrona({super.key});

  @override
  State<DrugaStrona> createState() => _MyAppState();
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
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.lightBlue.shade900
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalization.getTranslatedValue('Theme')),
          leading: IconButton(onPressed:(){Navigator.of(context).pop();} ,icon: const Icon(Icons.arrow_back),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Light-blue Theme')),
                value: 0,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Light-pink Theme')),
                value: 1,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Light Theme')),
                value: 2,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Dark-purple Theme')),
                value: 3,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Dark-blue Theme')),
                value: 4,
                groupValue: themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: Text(AppLocalization.getTranslatedValue('Dark Theme')),
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
                      MaterialPageRoute(builder: (context) => const FirstRoute()),
                    );
                  },
                  child: Text(AppLocalization.getTranslatedValue(AppLocalization.getTranslatedValue('Apply')), style: const TextStyle(fontSize: 18.0)),
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