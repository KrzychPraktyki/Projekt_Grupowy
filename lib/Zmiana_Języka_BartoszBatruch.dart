import 'package:flutter/material.dart';
import 'language.dart';
import 'MartynaLeman.dart';


void main() {
  runApp(const ZmianaJezyka());
}



class ZmianaJezyka extends StatelessWidget {
  const ZmianaJezyka({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
      home:Scaffold(
      appBar: AppBar (

        title: Text(AppLocalization.getTranslatedValue('Wybierz Język')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 300,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      AppLocalization.changeLanguage('en');
                    },
                    child: const Text('English'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 300,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      AppLocalization.changeLanguage('pl');
                    },
                    child: const Text('Polish(Polski)'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 300,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      AppLocalization.changeLanguage('de');
                    },
                    child: const Text('German(Deutsch)'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                SizedBox(
                  width: 300,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      AppLocalization.changeLanguage('ru');
                    },
                    child: const Text('Russian(Русский)'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}