import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChanger extends StatefulWidget {
  final Widget child;
  const LanguageChanger({required this.child, Key? key}) : super(key: key);
  @override
  _LanguageChangerState createState() => _LanguageChangerState();

  static _LanguageChangerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_LanguageChangerState>();
  }
}

class _LanguageChangerState extends State<LanguageChanger> {
  late SharedPreferences _prefs;
  late String _currentLanguage;

  Map<String, Map<String, String>> _translations = {
    'en': {
      'app_title': 'Language Changer',
      'english': 'English',
      'spanish': 'Spanish',
      'russian': 'Russian',
      'chinese': 'Chinese',
      'german': 'German',
      'swedish': 'Swedish',
      'polish': 'Polish',
    },
    'es': {
      'app_title': 'Cambiador de Idioma',
      'english': 'Inglés',
      'spanish': 'Español',
      'russian': 'Ruso',
      'chinese': 'Chino',
      'german': 'Alemán',
      'swedish': 'Sueco',
      'polish': 'Polaco',
    },
    'ru': {
      'app_title': 'Смена языка',
      'english': 'Английский',
      'spanish': 'Испанский',
      'russian': 'Русский',
      'chinese': 'Китайский',
      'german': 'Немецкий',
      'swedish': 'Шведский',
      'polish': 'Польский',
    },
    'zh': {
      'app_title': '语言切换器',
      'english': '英语',
      'spanish': '西班牙语',
      'russian': '俄语',
      'chinese': '中文',
      'german': '德语',
      'swedish': '瑞典语',
      'polish': '波兰语',
    },
    'de': {
      'app_title': 'Sprachwechsler',
      'english': 'Englisch',
      'spanish': 'Spanisch',
      'russian': 'Russisch',
      'chinese': 'Chinesisch',
      'german': 'Deutsch',
      'swedish': 'Schwedisch',
      'polish': 'Polnisch',
    },
    'sv': {
      'app_title': 'Språkbyte',
      'english': 'Engelska',
      'spanish': 'Spanska',
      'russian': 'Ryska',
      'chinese': 'Kinesiska',
      'german': 'Tyska',
      'swedish': 'Svenska',
      'polish': 'Polska',
    },
    'pl': {
      'app_title': 'Zmiana języka',
      'english': 'Angielski',
      'spanish': 'Hiszpański',
      'russian': 'Rosyjski',
      'chinese': 'Chiński',
      'german': 'Niemiecki',
      'swedish': 'Szwedzki',
      'polish': 'Polski',
    },
  };

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    _currentLanguage = _prefs.getString('language') ?? 'en';
    setState(() {});
  }

  void _changeLanguage(String languageCode) async {
    await _prefs.setString('language', languageCode);
    setState(() {
      _currentLanguage = languageCode;
    });
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text((_translations[_currentLanguage] != null
            ? _translations[_currentLanguage]!['app_title']
            : 'Wybierz język') ?? 'Wybierz język'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _changeLanguage('en'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['English']
                  : 'English') ?? 'English'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('es'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['spanish']
                  : 'Spanish') ?? 'Spanish'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('ru'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['russian']
                  : 'Russian') ?? 'Russian'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('zh'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['chinese']
                  : 'Chinese') ?? 'Chinese'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('de'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['german']
                  : 'German') ?? 'German'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('sv'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['swedish']
                  : 'Swedish') ?? 'Swedish'),
            ),
            ElevatedButton(
              onPressed: () => _changeLanguage('pl'),
              child: Text((_translations[_currentLanguage] != null
                  ? _translations[_currentLanguage]!['polish']
                  : 'Polish') ?? 'Polish'),
            ),
          ],
        ),
      ),
    );
  }
}