import 'package:day_1/ui/screens/home_screen.dart';
import 'package:day_1/ui/screens/menu_screen.dart';
import 'package:day_1/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  final List<IconData> _icons = [
    Icons.home_rounded,
    Icons.shopping_cart_rounded,
    Icons.menu_book_outlined,
    Icons.star_border_outlined,
    Icons.person_outline_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _navigateTo(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_icons.length, (index) {
          final isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () => _navigateTo(index),
            child: Icon(
              _icons[index],
              size: isSelected? 30 : 26,
              color: isSelected ? (isDark? Colors.white : Colors.black): Colors.grey,
            ),
          );
        }),
      ),
    );
  }
}
