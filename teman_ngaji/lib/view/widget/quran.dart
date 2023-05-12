import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';

import '../screen/quran_screen.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              color: background,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Positioned(bottom: 0, right: 0, child: Image.asset('assets/Quran.png')),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Sudah Baca Al Quran\nHari Ini?',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const QuranScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: button, borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Baca Quran',
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
