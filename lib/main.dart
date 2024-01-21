import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/provider/storage.dart';
import 'package:what_to_do/screens/navigation.dart';
import 'package:what_to_do/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: ThemeProvider(),
    ),
    ChangeNotifierProvider.value(
      value: DataStoreProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      title: 'UpTodo',
      home: const NavigationScreen(),
    );
  }
}
