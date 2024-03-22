class AppLocalization {
  static String defaultLanguage = 'en';

  static String getTranslatedValue(String key) {
    Map<String, Map<String, String>> localizedStrings = {
      'en': <String, String>{
        "MainPage" : 'Main Page',
        "Settings" : 'Settings',
        "Task Manager" : 'Task Manager',
        "Number Systems" : 'Number Systems',
        "Unit Conventer" : 'Unit Conventer',
        "Calorie Calculator" : 'Calorie Calculator',
        "Propability Calculator" : 'Propability Calculator',
        "Log in" : 'Log in',
        "Username" : 'Username',
        "Password" : 'Password',
        "Login" : 'Login',
        "Theme" : 'Theme',
        "Language" : 'Language',
        "Apply" : 'Apply',
        "Name" : 'Name',
        "Add" : 'Add',
        "Calorie" : 'Calorie',
        "All Calories" : 'All Calories',
        "Binary System" : 'Binary System',
        "Octal System" : 'Octal System',
        "Decimal System" : 'Decimal System',
        "Hexadecimal System" : 'Hexadecimal System',
        "Base-20 System" : 'Base-20 System',
        "Number of Favorable Outcomes" : 'Number of Favorable Outcomes',
        "Total Number of Possible Outcomes" : 'Total Number of Possible Outcomes',
        "Calculate" : 'Calculate',
        "Result:" : 'Result:',
        "Incorrect data" : 'Incorrect data',
        "Language Changer" : 'Language Changer',
        "English(English)" : 'English',
        "Polish(Polski)" : 'Polish(Polski)',
        "German(Deutsch)" : 'German(Deutsch)',
        "Russian(Русский)" : 'Russian(Русский)',
        "Light-blue Theme" : 'Light-blue Theme',
        "Light-pink Theme" : 'Light-pink Theme',
        "Light Theme" : 'Light Theme',
        "Dark-purple Theme" : 'Dark-purple Theme',
        "Dark-blue Theme" : 'Dark-blue Theme',
        "Dark Theme" : 'Dark Theme',
      },
      'pl': {
        "Main Page"  : 'Strona Główna',
        "Settings"  : 'Ustawienia',
        "Task Manager"  : 'Menadżer Zadań',
        "Number Systems"  : 'System Liczb',
        "Unit Conventer"  : 'Przelicznik jednostek',
        "Calorie Calculator"  : 'Kalkulator Kalorii',
        "Propability Calculator"  : 'Kalkulator Prawdopodobieństwa',
        "Log in"  : 'Logowanie',
        "Username"  : 'Nazwa użytkownika',
        "Password"  : 'Hasło',
        "Login"  : 'Zaloguj',
        "Theme"  : 'Motyw',
        "Language"  : 'Język',
        "Apply"  : 'Zastosuj',
        "Name"  : 'Nazwa',
        "Add"  : 'Dodaj',
        "Calorie" : 'Kalorie',
        "All Calories"  : 'Wszystkie Kalorie',
        "Binary System"  : 'System Binarny',
        "Octal System"  : 'System Ósemkowy',
        "Decimal System"  : 'System Decymalny' ,
        "Hexadecimal System"  : 'System Szesnastkowy',
        "Base-20 System"  : 'System Dwudziestkowy',
        "Number of Favorable Outcomes"  : 'Liczba korzystnych zdarzeń',
        "Total Number of Possible Outcomes"  : 'Liczba wszystkich możliwych zdarzeń',
        "Calculate"  : 'Oblicz',
        "Result:"  : 'Wynik:',
        "Incorrect data" : 'Nieprawidłowe dane',
        "Language Changer" : 'Zmiana Języka',
        "English(English)" : 'Angielski(English)',
        "Polish(Polski)" : 'Polski',
        "German(Deutsch)" : 'Niemiecki(Deutsch)',
        "Russian(Русский)" : 'Rosyjski(Русский)',
        "Light-blue Theme" : 'Jasnoniebieski Motyw',
        "Light-pink Theme" : 'Jasnoróżowy Motyw',
        "Light Theme" : 'Jasny Motyw',
        "Dark-purple Theme" : 'Ciemnofioletowy Motyw',
        "Dark-blue Theme" : 'Ciemnoniebieski Motyw',
        "Dark Theme" : 'Ciemny Motyw',
      },
      'de': {
        "Main Page"  : 'Heim',
        "Settings"  : 'Einstellungen',
        "Task Manager"  : 'Taskmanager',
        "Number Systems"  : 'Zahlensysteme',
        "Unit Conventer"  : 'Einheitenumwandler',
        "Calorie Calculator"  : 'Kalorienrechner',
        "Propability Calculator"  : 'Wahrscheinlichkeitsrechner',
        "Log in"  : 'Anmeldung',
        "Username"  : 'Nutzername',
        "Password"  : 'Passwort',
        "Login"  : 'Anmeldung',
        "Theme"  : 'Thema',
        "Language"  : 'Zunge',
        "Apply"  : 'Anwenden',
        "Name"  : 'Name',
        "Add"  : 'Hinzufügen',
        "Calorie" : 'Kalorien',
        "All Calories"  : 'Alle Kalorien',
        "Binary System"  : 'Binärsystem',
        "Octal System"  : 'Oktalsystem',
        "Decimal System"  : 'Dezimalsystem',
        "Hexadecimal System"  : 'Hexadezimalsystem',
        "Base-20 System"  : 'Basis-20-System',
        "Number of Favorable Outcomes" : 'Anzahl der günstigen Ereignisse',
        "Total Number of Possible Outcomes" : 'Gesamtzahl der möglichen Ereignisse',
        "Calculate"  : 'Berechnen',
        "Result:"  : 'Ergebnis:',
        "Incorrect data" : 'Falsche Daten',
        "Language Changer" : 'Sprachwechsler',
        "English(English)" : 'Englisch(English)',
        "Polish(Polski)" : 'Polieren(Polski)',
        "German(Deutsch)" : 'Deutsch',
        "Russian(Русский)" : 'Russisch(Русский)',
        "Light-blue Theme" : 'Hellblaues Motiv',
        "Light-pink Theme" : 'Helles Motiv - Rosa',
        "Light Theme" : 'Lichtthema',
        "Dark-purple Theme" : 'Motiv Dunkelviolett',
        "Dark-blue Theme" : 'Dunkelblaues Thema',
        "Dark Theme" : 'Dunkles Motiv',
      },
      'ru' : {
        "Main Page"  : 'Дом',
        "Settings"  : 'Настройки',
        "Task Manager"  : 'Диспетчер Эадач',
        "Number Systems"  : 'Системы Счисления',
        "Unit Conventer"  : 'Конвертер',
        "Calorie Calculator"  : 'Калькулятор Калорий',
        "Propability Calculator"  : 'Калькулятор Вероятности',
        "Log in" : 'Авторизоваться',
        "Username"  : 'Имя Пользователя',
        "Password"  : 'Пароль',
        "Login"  : 'Авторизоваться',
        "Theme"  : 'Тема',
        "Language"  : 'Язык',
        "Apply"  : 'Применять',
        "Name"  : 'Имя',
        "Add"  : 'Добавлять',
        "Calorie" : 'Калорийность',
        "All Calories"  : 'Все Калории',
        "Binary System"  : 'Бинарная Система',
        "Octal System" : 'Восьмеричная Cистема',
        "Decimal System"  : 'Десятичная Cистема' ,
        "Hexadecimal System"  : 'Шестнадцатеричная Cистема',
        "Base-20 System"  : 'Двадцатеричная Cистема',
        "Number of Favorable Outcomes"  : 'Количество Благоприятных Исходов',
        "Total Number of Possible Outcomes" : 'Общее количество возможных исходов',
        "Calculate"  : 'Рассчитать',
        "Result:"  : 'Результат:',
        "Incorrect data" : 'Неверные данные',
        "Language Changer" : 'Смена Языка',
        "English(English)" : 'Английский(English)',
        "Polish(Polski)" : 'Польский(Polski)',
        "German(Deutsch)" : 'Немецкий(Deutsch)',
        "Russian(Русский)" : 'Русский',
        "Light-blue Theme" : 'Светло-голубой мотив',
        "Light-pink Theme" : 'Светло-розовый мотив',
        "Light Theme" : 'Светлый мотив',
        "Dark-purple Theme" : 'Темно-фиолетовый мотив',
        "Dark-blue Theme" : 'Темно-синий мотив',
        "Dark Theme" : 'Темная тема',
      }
    };

    // Return the translated value for the given key
    return localizedStrings[defaultLanguage]?[key] ?? key;
  }

  static void changeLanguage(String languageCode) {
    // Change the current language
    defaultLanguage = languageCode;
  }
}