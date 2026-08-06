import 'dart:math';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:sotaynauan/models/dish_model.dart';
import 'package:sotaynauan/data/localized_dishes.dart';
import 'package:sotaynauan/widgets/dish_card.dart';
import 'package:sotaynauan/screens/dish_detail_screen.dart';

class DishListScreen extends StatefulWidget {
  const DishListScreen({super.key});

  @override
  State<DishListScreen> createState() => _DishListScreenState();
}

class _DishListScreenState extends State<DishListScreen> {
  late Locale _locale;
  List<Dish> _dishes = [];
  bool _isLoading = true;
  String _searchQuery = '';
  String? _selectedCategory;
  String? _selectedDifficulty;
  String? _selectedCookingTime; // Could be ranges like "under 30min", "30-60min", "over 60min"
  final Set<String> _favoriteIds = {};

  @override
  void initState() {
    super.initState();
    // Initialize with default locale
    _locale = const Locale('en', 'US');
    _loadDishes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Locale currentLocale = Localizations.localeOf(context);
    if (_locale != currentLocale) {
      _locale = currentLocale;
      // Reset filters when locale changes to avoid mismatched localized strings
      _selectedCategory = null;
      _selectedDifficulty = null;
      _selectedCookingTime = null;
      _loadDishes();
    }
  }

  Future<void> _loadDishes() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _dishes = getLocalizedDishes(_locale);
      _isLoading = false;
    });
  }

  List<Dish> get filteredDishes {
    return _dishes.where((dish) {
      final matchesSearch = dish.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase()) ||
          dish.description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _selectedCategory == null || dish.category == _selectedCategory;

      final matchesDifficulty = _selectedDifficulty == null ||
          dish.difficulty.toString().split('.').last == _selectedDifficulty;

      final matchesCookingTime = _selectedCookingTime == null ||
          _matchesCookingTimeFilter(dish, _selectedCookingTime!);

      return matchesSearch && matchesCategory && matchesDifficulty && matchesCookingTime;
    }).toList();
  }

  bool _matchesCookingTimeFilter(Dish dish, String filter) {
    final totalTime = dish.totalTimeMinutes;
    switch (filter) {
      case 'under_30':
        return totalTime < 30;
      case '30_to_60':
        return totalTime >= 30 && totalTime <= 60;
      case 'over_60':
        return totalTime > 60;
      default:
        return true;
    }
  }

  void _toggleFavorite(String dishId) {
    setState(() {
      if (_favoriteIds.contains(dishId)) {
        _favoriteIds.remove(dishId);
      } else {
        _favoriteIds.add(dishId);
      }
    });
  }

  void _showRandomDish() {
    if (_dishes.isNotEmpty) {
      final randomIndex = (_dishes.length * Random().nextDouble()).floor();
      final randomDish = _dishes[randomIndex];

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DishDetailScreen(
          dish: randomDish,
          isFavorite: _favoriteIds.contains(randomDish.id),
          onToggleFavorite: (bool isFav) {
            _toggleFavorite(randomDish.id);
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white, // Ensure white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          l10n?.exploreRecipes ?? 'Explore Recipes',
          style: const TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search field
                TextField(
                  decoration: InputDecoration(
                    hintText: l10n?.searchHint ?? 'Search dishes...',
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 8),
                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: Text(l10n?.all ?? 'All', style: const TextStyle(color: Colors.black)),
                        selected: _selectedCategory == null,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = null;
                          });
                        },
                        selectedColor: Colors.grey.shade300,
                        checkmarkColor: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: Text(l10n?.noodles ?? 'Noodles', style: const TextStyle(color: Colors.black)),
                        selected: _selectedCategory == (_locale.languageCode == 'vi' ? 'Mì' : 'Noodle'),
                        onSelected: (selected) {
                          setState(() {
                            // Set category based on current locale
                            _selectedCategory = selected ? (_locale.languageCode == 'vi' ? 'Mì' : 'Noodle') : null;
                          });
                        },
                        selectedColor: Colors.grey.shade300,
                        checkmarkColor: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: Text(l10n?.rice ?? 'Rice', style: const TextStyle(color: Colors.black)),
                        selected: _selectedCategory == (_locale.languageCode == 'vi' ? 'Cơm' : 'Rice'),
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? (_locale.languageCode == 'vi' ? 'Cơm' : 'Rice') : null;
                          });
                        },
                        selectedColor: Colors.grey.shade300,
                        checkmarkColor: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: Text(l10n?.soup ?? 'Soup', style: const TextStyle(color: Colors.black)),
                        selected: _selectedCategory == (_locale.languageCode == 'vi' ? 'Súp' : 'Soup'),
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? (_locale.languageCode == 'vi' ? 'Súp' : 'Soup') : null;
                          });
                        },
                        selectedColor: Colors.grey.shade300,
                        checkmarkColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: Text(l10n?.loading ?? 'Loading...', style: const TextStyle(color: Colors.black)),
            )
          : filteredDishes.isEmpty
              ? Center(
                  child: Text(l10n?.noDishesFound ?? 'No dishes found', style: const TextStyle(color: Colors.black)),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: filteredDishes.length,
                    itemBuilder: (context, index) {
                      final dish = filteredDishes[index];
                      return DishCard(
                        dish: dish,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DishDetailScreen(
                                  dish: dish,
                                  isFavorite: _favoriteIds.contains(dish.id),
                                  onToggleFavorite: (bool isFav) {
                                    _toggleFavorite(dish.id);
                                  },
                                ),
                          ));
                        },
                        isFavorite: _favoriteIds.contains(dish.id),
                        onToggleFavorite: (bool isFav) {
                          _toggleFavorite(dish.id);
                        },
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _showRandomDish,
        tooltip: l10n?.exploreRecipes ?? 'Explore',
        child: const Icon(Icons.shuffle, color: Colors.white),
      ),
    );
  }
}