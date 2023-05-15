import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KajianWidget extends StatefulWidget {
  const KajianWidget({super.key});

  @override
  State<KajianWidget> createState() => _KajianWidgetState();
}

class _KajianWidgetState extends State<KajianWidget> {
  final List<String> imageName = [
    'assets/kajian1.jpeg',
    'assets/kajian2.jpeg',
    'assets/kajian3.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jadwal Majelis Ilmu Terdekat',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 5,
          ),
          CarouselSlider.builder(
            itemCount: imageName.length,
            itemBuilder: (context, index, realIndex) {
              final name = imageName[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // margin: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      name,
                      fit: BoxFit.fill,
                      width: 250,
                      height: 250,
                    )),
              );
            },
            options: CarouselOptions(
                autoPlay: true, autoPlayInterval: const Duration(seconds: 3)),
          ),
        ],
      ),
    );
  }
}
