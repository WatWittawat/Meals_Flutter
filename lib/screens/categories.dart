import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoreiesScreen extends StatelessWidget {
  final List<Meal> availableMeal;
  const CategoreiesScreen({super.key, required this.availableMeal});
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }

  void _selectCategory(BuildContext context, Category category) {
    final fliteredMeals = availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meals: fliteredMeals,
      );
    }));
  }
}
