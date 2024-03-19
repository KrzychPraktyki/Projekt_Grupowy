import 'package:flutter/material.dart';
class TrzeciaStrona extends StatelessWidget {
  const TrzeciaStrona({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Center(
        child: ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('back!'),
        ),
      ),
    );
  }
}


