import 'package:flutter/material.dart';
import 'language_changer_ArturZaborowski.dart';

void main() {
  runApp(ZmianaJezyka());
}

class ZmianaJezyka extends StatelessWidget {
  const ZmianaJezyka({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wybierz Język',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageChanger(child: Door()),
      debugShowCheckedModeBanner: false,
    );
  }
}



class Door extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Door Page'),
      ),
      body: Center(
        child: Text('This is the Door Page'),
      ),
    );
  }
}
