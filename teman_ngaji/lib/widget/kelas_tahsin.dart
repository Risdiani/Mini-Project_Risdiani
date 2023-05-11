import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';

class KelasTahsin extends StatelessWidget {
  const KelasTahsin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 100,
        decoration: BoxDecoration(
            color: green,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
      Text(
        'Kelas Tahsin Online',
        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.start,
      ),
      Positioned(
        bottom: 15,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const KelasTahsin()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: button, borderRadius: BorderRadius.circular(30)),
            child: Text(
              'Lihat Jadwal Kelas',
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      )
    ]);
  }
}
