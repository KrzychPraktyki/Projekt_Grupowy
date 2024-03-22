import 'package:flutter/material.dart';
import 'language.dart';
import 'martynaleman.dart';

class PiataStrona extends StatelessWidget {
  const PiataStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalorieTracker extends StatefulWidget {
  const CalorieTracker({super.key});

  @override
  State<CalorieTracker> createState() => _CalorieTrackerState();
}

class _CalorieTrackerState extends State<CalorieTracker> {
  final List<FoodItem> _foodItems = [];
  int _totalCalories = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();

  void _addItem(String name, int calories) {
    setState(() {
      _foodItems.add(FoodItem(name: name, calories: calories));
      _totalCalories += calories;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _totalCalories -= _foodItems[index].calories;
      _foodItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themeslist().themeses[themeIndex],
        home:Scaffold(

          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Row(
              children: [
                Text(AppLocalization.getTranslatedValue('Calorie Calculator')),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _foodItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_foodItems[index].name),
                      subtitle: Text('${_foodItems[index].calories} calories'),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: AppLocalization.getTranslatedValue('Name'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _caloriesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLocalization.getTranslatedValue('Calorie'),
                        ),
                      ),
                    ),
                    const SizedBox(width:10),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        String name = _nameController.text;
                        int calories = int.tryParse(_caloriesController.text) ?? 0;
                        if (name.isNotEmpty && calories > 0) {
                          _addItem(name, calories);
                          _nameController.clear();
                          _caloriesController.clear();
                        }
                      },
                      child: Text(AppLocalization.getTranslatedValue('Add')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(AppLocalization.getTranslatedValue('All Calories: $_totalCalories')),
              const SizedBox(height: 30),
            ],
          ),
        ));

  }
}

class FoodItem {
  final String name;
  final int calories;

  FoodItem({required this.name, required this.calories});
}
