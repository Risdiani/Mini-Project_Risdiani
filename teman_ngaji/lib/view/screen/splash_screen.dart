import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/view/screen/home_screen.dart';
import 'package:teman_ngaji/view/screen/login_screen.dart';
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
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset('assets/splash.png'),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -45,
                      child: Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            decoration: BoxDecoration(
                                color: button,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Tap Here',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
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
