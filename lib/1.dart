import 'package:flutter/material.dart';
import 'language_changer.dart'; // Importujemy plik z logiką zmiany języka.

void main() {
  runApp(PierwszaStrona());
}

class PierwszaStrona extends StatelessWidget {
  const PierwszaStrona({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageChanger(), // Tutaj umieszczamy LanguageChanger jako główną stronę
    );
  }
}
