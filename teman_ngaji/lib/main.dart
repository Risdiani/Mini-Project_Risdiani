import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teman Ngaji',
        theme: ThemeData(
            primarySwatch: Colors.brown,
            fontFamily: GoogleFonts.poppins().fontFamily),
        home: const HomeScreen());
  }
}
