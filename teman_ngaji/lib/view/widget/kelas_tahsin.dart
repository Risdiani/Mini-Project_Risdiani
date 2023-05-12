import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';
import 'package:teman_ngaji/view/screen/daftar_kelas.dart';

class KelasTahsin extends StatelessWidget {
  const KelasTahsin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kelas Tahsin Online',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DaftarKelas()));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      color: button, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Lihat Jadwal Kelas',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DaftarKelas()));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      color: button, borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Lihat Jadwal Kelas',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}