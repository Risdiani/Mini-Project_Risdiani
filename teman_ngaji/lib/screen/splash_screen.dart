import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Teman Ngaji',
                    style: GoogleFonts.poppins(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28)),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Teman Terbaik,\nTempat Terindah',
                  style: GoogleFonts.poppins(color: text, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                Stack(
                  children: [
                    Container(
                      height: 450,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF672CBC)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
