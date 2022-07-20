import 'package:flutter/material.dart';
import 'package:genshinapp/screens/domain_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genshin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DomainListScreen(),
    );
  }
}
