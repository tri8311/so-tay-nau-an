class Dish {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final String category;
  final Difficulty difficulty;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final List<String> tags; // e.g., ['vegetarian', 'spicy']

  const Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.category,
    required this.difficulty,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.tags,
  });

  int get totalTimeMinutes => prepTimeMinutes + cookTimeMinutes;

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      ingredients: List<String>.from(map['ingredients']),
      steps: List<String>.from(map['steps']),
      category: map['category'] as String,
      difficulty: _parseDifficulty(map['difficulty']),
      prepTimeMinutes: map['prepTimeMinutes'] as int,
      cookTimeMinutes: map['cookTimeMinutes'] as int,
      tags: List<String>.from(map['tags'] ?? []),
    );
  }

  static Difficulty _parseDifficulty(dynamic value) {
    if (value == 'easy') return Difficulty.easy;
    if (value == 'hard') return Difficulty.hard;
    return Difficulty.medium;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'category': category,
      'difficulty': difficulty.toString().split('.').last,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'tags': tags,
    };
  }
}

enum Difficulty { easy, medium, hard }