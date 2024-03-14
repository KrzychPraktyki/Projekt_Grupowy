import 'package:flutter/material.dart';

class PiataStrona extends StatelessWidget {
  const PiataStrona({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    );
  }
}


class CalorieTracker extends StatefulWidget {
  @override
  _CalorieTrackerState createState() => _CalorieTrackerState();
}

class _CalorieTrackerState extends State<CalorieTracker> {
  List<FoodItem> _foodItems = [];
  int _totalCalories = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _caloriesController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Calorie Tracker'),
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
                    icon: Icon(Icons.close),
                    onPressed: () => _removeItem(index),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _caloriesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    int calories = int.tryParse(_caloriesController.text) ?? 0;
                    if (name.isNotEmpty && calories > 0) {
                      _addItem(name, calories);
                      _nameController.clear();
                      _caloriesController.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('Total Calories: $_totalCalories'),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final int calories;

  FoodItem({required this.name, required this.calories});
}