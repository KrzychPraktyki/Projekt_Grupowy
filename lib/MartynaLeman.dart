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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade100
    ),
    ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.red.shade100
    ),
    ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green.shade100
    ),
    ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple.shade100
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
                title: const Text('Motyw niebieski'),
                value: 0,
                groupValue: _themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw czewony'),
                value: 1,
                groupValue: _themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw zielony'),
                value: 2,
                groupValue: _themeIndex,
                onChanged: _handleThemeChange,
              ),
              RadioListTile(
                title: const Text('Motyw fioletowy'),
                value: 3,
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
