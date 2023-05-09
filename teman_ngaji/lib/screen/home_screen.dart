import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: (() => {}), icon: Image.asset('assets/sidebar.png')),
            const SizedBox(
              width: 24,
            ),
            Text(
              'Teman Ngaji',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: (() => {}), icon: Image.asset('assets/search.png')),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavbar(),
    );
  }

  BottomNavigationBar _bottomNavbar() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: button,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: 'Profile'),
          ]);
}
