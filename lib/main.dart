import 'package:flutter/material.dart';
import 'package:genshinapp/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}
class ThemeClass{
 
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    )
  );
 
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255,30,30,30),
    colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 33, 37, 243),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genshin App',
      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
