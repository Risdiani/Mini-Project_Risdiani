import 'package:flutter/material.dart';
import 'package:teman_ngaji/screen/profile_screen.dart';
import 'package:teman_ngaji/screen/quran_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const QuranScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Teman Ngaji',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Padding(padding: EdgeInsets.all(16)));
  }
}
