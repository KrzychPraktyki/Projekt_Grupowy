import 'package:flutter/material.dart';

class PiataStrona extends StatelessWidget {
  const PiataStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Kalorii'),
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