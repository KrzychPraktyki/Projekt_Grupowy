
import 'package:flutter/material.dart';
import 'language.dart';


void main() {
  runApp(ZmianaJezyka());
}



class ZmianaJezyka extends StatelessWidget {
  const ZmianaJezyka({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(AppLocalization.getTranslatedValue('Wybierz Język')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          SizedBox(
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
                    child: Text('English'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
                    child: Text('Polish(Polski)'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
                    child: Text('German(Deutsch)'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
                    child: Text('Russian(Русский)'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}