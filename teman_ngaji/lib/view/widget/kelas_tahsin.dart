import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teman_ngaji/utils/theme.dart';
import 'package:teman_ngaji/view/screen/daftar_kelas.dart';
import 'package:teman_ngaji/view/widget/view_model/kelastahsin_provider.dart';

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
          _kelasTahsin(context),
          const SizedBox(
            height: 3,
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
                    'Lihat Daftar Kelas',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  _kelasTahsin(BuildContext context) {
    final imageProvider = Provider.of<ImageName>(context, listen: false);
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        final name = imageProvider.image[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              name,
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
    );
  }
}
