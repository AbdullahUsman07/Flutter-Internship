// import 'package:day_1/provider/meal_cateogory_provider.dart';
// import 'package:day_1/ui/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MealCategoryProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Food App UI',
//         theme: ThemeData(
//           brightness: Brightness.dark,
//           scaffoldBackgroundColor: const Color(0xFF1B1B1D),
//           textTheme: GoogleFonts.poppinsTextTheme(
//             ThemeData.dark().textTheme,
//           ),
//           colorScheme: ColorScheme.dark(
//             primary: const Color(0xFFFF5C8D), 
//             secondary: const Color(0xFF2A2A2C), 
//           ),
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//           ),
//         ),
//         home: const HomeScreen(),
//       ),
//     );
//   }
// }

import 'package:day_1/provider/meal_cateogory_provider.dart';
import 'package:day_1/provider/theme_provider.dart';
import 'package:day_1/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealCategoryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App UI',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
    );
  }
}

