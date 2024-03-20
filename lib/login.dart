import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'language.dart';
import 'MartynaLeman.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _passController = TextEditingController();

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: Themeslist().themeses[themeIndex],
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 25),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.getTranslatedValue('Logowanie')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nazwa Użytkownika',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: 'Hasło',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstRoute()),
                  );
                },
                child: Text(AppLocalization.getTranslatedValue('Zaloguj')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
