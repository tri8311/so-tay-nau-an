import 'package:flutter/material.dart';
import 'package:sotaynauan/models/dish_model.dart';
import 'package:sotaynauan/data/mock_dishes.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  List<Dish> dishes = [];
  bool isLoading = true;
  // Simple meal plan: Map<dayIndex, List<Dish>> where dayIndex 0=Monday, 6=Sunday
  final Map<int, List<Dish>> _mealPlan = {};

  @override
  void initState() {
    super.initState();
    _loadDishes();
  }

  Future<void> _loadDishes() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      dishes = mockDishes;
      isLoading = false;

      // Pre-populate with some sample data for demo after dishes are loaded
      if (dishes.isNotEmpty) {
        _mealPlan[0] = [dishes.firstWhere((d) => d.id == '1', orElse: () => dishes.first)];
        _mealPlan[2] = [dishes.firstWhere((d) => d.id == '2', orElse: () => dishes.first)];
        _mealPlan[4] = [dishes.firstWhere((d) => d.id == '3', orElse: () => dishes.first)];
      }
    });
  }

  void _addMealToDay(int dayIndex, Dish dish) {
    setState(() {
      _mealPlan[dayIndex] ??= [];
      _mealPlan[dayIndex]!.add(dish);
    });
  }

  void _showAddMealDialog(BuildContext context, int dayIndex) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Meal to ${['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][dayIndex]}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: dishes.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: dishes.length,
                      itemBuilder: (context, index) {
                        final dish = dishes[index];
                        return ListTile(
                          leading: Image.network(
                            dish.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(dish.name),
                          subtitle: Text('${dish.category} • ${dish.prepTimeMinutes + dish.cookTimeMinutes} min'),
                          onTap: () {
                            _addMealToDay(dayIndex, dish);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${dish.name} added to meal plan!')),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Navigate to shopping list
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                final dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
                final mealsForDay = _mealPlan[index] ?? [];
                return ExpansionTile(
                  title: Text('$dayName, ${DateTime.now().add(Duration(days: index)).day} ${DateTime.now().add(Duration(days: index)).month}'),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    child: Text(
                      dayName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  children: [
                    mealsForDay.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('No meals planned for this day. Tap to add.'),
                          )
                        : Column(
                            children: mealsForDay.map((meal) => ListTile(
                                  leading: const Icon(Icons.restaurant),
                                  title: Text(meal.name),
                                  subtitle: Text('${meal.prepTimeMinutes + meal.cookTimeMinutes} min'),
                                  onTap: () {
                                    // TODO: Show dish details or options
                                  },
                                )).toList(),
                          ),
                  ],
                  onExpansionChanged: (expanded) {
                    if (expanded) {
                      // Show a simple dialog to add a meal
                      _showAddMealDialog(context, index);
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Show a dialog to add a meal to today or a specific day
        },
        tooltip: 'Add Meal',
        child: const Icon(Icons.add),
      ),
    );
  }
}