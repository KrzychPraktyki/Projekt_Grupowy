import 'package:flutter/material.dart';


class DrugaStrona extends StatefulWidget {
  const DrugaStrona({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DrugaStrona> {
  int _themeIndex = 0;
  final List<ThemeData> _themes = [
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade100

    ),
    ThemeData(
      brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple.shade800
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motyw',
      theme: _themes[_themeIndex],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Motyw'),
        ),
        body: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile(
                title: const Text('Motyw jasny-niebieski'),
                value: 0,
                groupValue: _themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw ciemny-fioletowy'),
                value: 1,
                groupValue: _themeIndex,
                onChanged: _handleThemeChange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleThemeChange(int? value) {
    setState(() {
      _themeIndex = value!;
    });
  }
}
