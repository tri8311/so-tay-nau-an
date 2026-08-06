import 'package:flutter/material.dart';
import 'package:sotaynauan/screens/group_info_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // User profile placeholder
        const ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Your Name'),
          subtitle: Text('user@example.com'),
        ),
        const Divider(),
        // Favorites placeholder
        ListTile(
          leading: const Icon(Icons.favorite, color: Colors.red),
          title: const Text('Yêu thích'),
          subtitle: const Text('Xem món ăn yêu thích của bạn'),
          onTap: () {
            // TODO: Navigate to favorites screen
          },
        ),
        const Divider(),
        // Group info
        ListTile(
          leading: const Icon(Icons.group, color: Colors.blue),
          title: const Text('Thông tin nhóm'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GroupInfoScreen(),
            ));
          },
        ),
        const Divider(),
        // Settings
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Cài đặt'),
          onTap: () {
            // TODO: Navigate to settings
          },
        ),
        const Divider(),
        // About
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Về ứng dụng'),
          onTap: () {
            // TODO: Show about dialog
          },
        ),
      ],
    );
  }
}