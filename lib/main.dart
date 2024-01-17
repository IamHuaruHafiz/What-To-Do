import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/screens/navigation.dart';
import 'package:what_to_do/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpTodo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const NavigationScreen(),
    );
  }
}
