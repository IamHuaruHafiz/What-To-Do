import 'package:flutter/material.dart';
import 'package:what_to_do/screens/home.dart';
import 'package:what_to_do/screens/settings.dart';
import 'package:what_to_do/widgets/add_task_button.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          backgroundColor: Theme.of(context).colorScheme.background,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          currentIndex: currentIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              label: "",
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.settings_outlined),
            )
          ]),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _widgetOptions[currentIndex],
    );
  }
}
