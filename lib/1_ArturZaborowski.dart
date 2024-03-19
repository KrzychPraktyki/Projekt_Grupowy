import 'package:flutter/material.dart';

void main() {
  runApp(ZmianaJezyka());
}

class ZmianaJezyka extends StatelessWidget {
  const ZmianaJezyka({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Wybierz Język'),
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

                },
                child: Text('Engish'),
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

                },
                child: Text('Russian(Русский)'),
              ),
            ),
          ],
        ),
        ),
      ],
      )

    );
  }
}



