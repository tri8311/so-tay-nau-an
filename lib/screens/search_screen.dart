import 'package:flutter/material.dart';
import 'package:sotaynauan/models/dish_model.dart';
import 'package:sotaynauan/widgets/dish_card.dart';
import 'package:sotaynauan/screens/dish_detail_screen.dart';
import 'package:sotaynauan/data/mock_dishes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Dish> dishes = [];
  bool isLoading = true;
  String _searchQuery = '';
  String? _selectedCategory;
  // To store favorite dish IDs
  final Set<String> _favoriteIds = {};

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
    });
  }

  List<Dish> get filteredDishes {
    return dishes.where((dish) {
      final matchesSearch = dish.name
          .toLowerCase()
          .contains(_searchQuery.toLowerCase()) ||
          dish.description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _selectedCategory == null || dish.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Dishes'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search dishes...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: _selectedCategory == null,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = null;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('Noodles'),
                        selected: _selectedCategory == 'Noodle Soup',
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? 'Noodle Soup' : null;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('Rice'),
                        selected: _selectedCategory == 'Rice Dish',
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? 'Rice Dish' : null;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text('Soup'),
                        selected: _selectedCategory == 'Soup',
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? 'Soup' : null;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // TODO: Show filter bottom sheet
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredDishes.isEmpty
              ? const Center(child: Text('No dishes found'))
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
        onPressed: () {
          // TODO: Navigate to add dish or show random dish
        },
        tooltip: 'Explore',
        child: const Icon(Icons.explore),
      ),
    );
  }
}