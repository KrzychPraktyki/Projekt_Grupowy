import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _passController = TextEditingController();

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logowanie'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nazwa Użytkownika',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextField(
                  controller: _passController,
                  decoration: const InputDecoration(
                    labelText: 'Hasło',
                  ),
                ),
              ),
              const SizedBox(height: 35,),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstRoute()),
                  );
                },
                child: const Text('Zaloguj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

