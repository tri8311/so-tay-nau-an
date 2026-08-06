#  Vietnamese Recipe Book

A Flutter mobile application showcasing traditional Vietnamese recipes with bilingual support (English/Vietnamese), filtering capabilities, and beautiful UI.

## 👥 Team Members
- **Đỗ Minh Trí** - Student ID: 24100517
- **Nguyễn Bá Trường Giang** - Student ID: 24100470

## 📱 Features
- Browse 8 authentic Vietnamese recipes
- Fully bilingual interface (English/Tiếng Việt)
- Smart filtering by category, difficulty, and cooking time
- Random recipe discovery
- Favorite recipe bookmarking
- Responsive design for mobile devices
- High-quality recipe images

##  Technical Stack
- **Framework**: Flutter (Dart)
- **State Management**: StatefulWidget with setState
- **Localization**: Custom locale handling with AppLocalizations
- **UI Components**: Custom widgets with Material Design
- **Assets**: Local image storage for recipe photos

##  📋 Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter plugins
- An emulator or physical device for testing

##🚀 Getting Started

Follow these steps to run the project locally:

### 1. Clone the Repository
```bash
git clone [your-repository-url]
cd sotaynauan
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Application
Ensure you have an emulator running or a device connected, then:
```bash
flutter run
```

For web testing (Chrome):
```bash
flutter run -d chrome
```

### 4. Available Commands
- `flutter pub get` - Fetch dependencies
- `flutter run` - Run on attached device/emulator
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter test` - Run unit tests

##  📁 Project Structure
```
lib/
├── main.dart                 # App entry point
├── l10n/                     # Localization files
│   └── app_localizations.dart
├── models/                   # Data models
│   └── dish_model.dart
├── data/                     # Data sources
│   └── localized_dishes.dart
├── screens/                  # UI Screens
│   ├── home_screen.dart
│   ├── dish_list_screen.dart
│   └── dish_detail_screen.dart
├── widgets/                  # Reusable widgets
│   └── dish_card.dart
�└── assets/                   # Image assets
    └── imgs/
```

## �� 🌐 Localization
The app supports two languages:
- English (en)
- Vietnamese (vi)

Language can be switched via the globe icon in the app bar on the Home screen.

## 🧪 Testing
Run unit tests with:
```bash
flutter test
```

##  📱 Screens Overview
1. **Home Screen**: App title, featured image (~2/3 height), and navigation to recipe list
2. **Dish List Screen**: Search bar, category filters, advanced filters (difficulty/cooking time), grid view of recipes, and random recipe FAB
3. **Dish Detail Screen**: Full recipe view with image, description, ingredients list, and step-by-step instructions

##  🔧 Advanced Features
- **Search**: Real-time filtering by dish name and description
- **Category Filters**: Noodle (Mì), Rice (Cơm), Soup (Súp), etc. - localized to current language
- **Difficulty Filters**: Easy, Medium, Hard
- **Cooking Time Filters**: Under 30min, 30-60min, Over 60min
- **Favorites**: Toggle favorite status with visual feedback
- **Random Discovery**: FAB to explore random recipes

##  🐛 Known Issues
- Image paths are case-sensitive (ensure asset filenames match exactly)
- Web performance may vary with large images
- Localization requires app restart for full UI refresh (limitation of current implementation)

##  📄 License
This project is for educational purposes.

##  🙏 Acknowledgements
- Flutter team for the excellent framework
- Vietnamese culinary traditions for inspiring the recipes
- Open-source community for various Flutter packages and techniques

---
*Developed by Đỗ Minh Trí (24100517) and Nguyễn Bá Trường Giang (24100470) as part of their coursework.*# so-tay-nau-an
