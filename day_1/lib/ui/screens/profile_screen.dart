import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: (isDarkMode)?  Colors.black : Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text('Username', style: TextStyle(color: (isDarkMode) ? Colors.white : Colors.black
                      , fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('123-Street, City', style: TextStyle(color: (isDarkMode) ? Colors.white : Colors.black, fontSize: 14)),
                      Text('user@example.com', style: TextStyle(color: (isDarkMode) ? Colors.white : Colors.black, fontSize: 14)),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/handsome-man-standing-front-city-building.jpg'),
                  ),
                ],
              )
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
