import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onLocaleChanged,
  });

  final void Function(Locale) onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          l10n?.appTitle ?? 'Vietnamese Recipe Book',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: onLocaleChanged,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              PopupMenuItem<Locale>(
                value: const Locale('en', 'US'),
                child: Text(l10n?.english ?? 'English',
                    style: const TextStyle(color: Colors.black)),
              ),
              PopupMenuItem<Locale>(
                value: const Locale('vi', 'VN'),
                child: Text(l10n?.vietnamese ?? 'Tiếng Việt',
                    style: const TextStyle(color: Colors.black)),
              ),
            ],
            icon: const Icon(Icons.language, color: Colors.black),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Title section - "Sách nấu ăn"
                Text(
                  'Sách nấu ăn',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                // Image taking approximately 2/3 of the available height
                SizedBox(
                  height: constraints.maxHeight * 0.6, // 60% of available height (~2/3)
                  child: Image.asset(
                    'lib/imgs/ảnh-trang-chủ.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).pushNamed('/dish_list');
        },
        tooltip: l10n?.exploreRecipes ?? 'Explore Recipes',
        child: const Icon(Icons.restaurant_menu, color: Colors.white),
      ),
    );
  }
}