import 'package:flutter/material.dart';

class PierwszaStrona extends StatelessWidget {
  const PierwszaStrona ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Język'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back!'),
        ),
      ),
    );
  }
}
