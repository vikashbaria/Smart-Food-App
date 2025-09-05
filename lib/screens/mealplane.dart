import 'package:flutter/material.dart';

class Mealplane extends StatefulWidget {
  const Mealplane({super.key});

  @override
  State<Mealplane> createState() => MealplaneState();
}

class MealplaneState extends State<Mealplane> {
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Meal list store karne ke liye
  final List<Map<String, String>> _meals = [];

  void _addMeal() {
    final meal = _mealController.text.trim();
    final date = _dateController.text.trim();

    if (meal.isEmpty || date.isEmpty) return;

    setState(() {
      _meals.add({"meal": meal, "date": date});
      _mealController.clear();
      _dateController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _mealController,
              decoration: InputDecoration(
                labelText: "Meal Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: "Date (e.g. 2025-09-05)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: _addMeal,
              icon: const Icon(Icons.add),
              label: const Text("Add Meal"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Your Meals:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: _meals.isEmpty
                  ? const Center(child: Text("No meals added yet"))
                  : ListView.builder(
                      itemCount: _meals.length,
                      itemBuilder: (context, index) {
                        final meal = _meals[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: const Icon(
                              Icons.restaurant_menu,
                              color: Colors.orange,
                            ),
                            title: Text(meal["meal"]!),
                            subtitle: Text("Date: ${meal["date"]}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
