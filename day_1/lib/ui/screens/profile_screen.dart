import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text('Profile Drawer', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text(
              'App Theme',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
