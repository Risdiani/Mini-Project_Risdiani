import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/model/surah_detail_model.dart';
import 'package:teman_ngaji/model/surah_model.dart';
import 'package:teman_ngaji/utils/theme.dart';

class DetailQuran extends StatelessWidget {
  final int nomorSurat;

  const DetailQuran({super.key, required this.nomorSurat});

  Future<SurahModel> _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/$nomorSurat");
    return SurahModel.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SurahModel>(
        future: _getDetailSurah(),
        initialData: null,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: green,
            );
          }
          SurahModel surah = snapshot.data!;
          return Scaffold(
            backgroundColor: green,
            appBar: _appBar(context: context, surah: surah),
            body: NestedScrollView(
                headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _details(surah: surah),
                      )
                    ]),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        _ayatItem(ayat: surah.ayat!.elementAt(index)),
                    itemCount: surah.jumlahAyat,
                    separatorBuilder: (context, index) => Container(),
                  ),
                )),
          );
        });
  }

  Widget _ayatItem({required ayat}) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(27 / 2)),
                child: Center(
                  child: Text(
                    "${ayat.nomor}",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            ayat.ar,
            style: GoogleFonts.amiri(
                color: background, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            ayat.idn,
            style: GoogleFonts.poppins(color: background, fontSize: 16),
            textAlign: TextAlign.right,
          ),
        ],
      );

  Widget _details({required SurahModel surah}) => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Stack(
          children: [
            Container(
              height: 257,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    surah.namaLatin,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    surah.arti,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(.35),
                    thickness: 2,
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah.tempatTurun.name,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${surah.jumlahAyat} Ayat",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset('assets/bismillah.svg')
                ],
              ),
            ),
          ],
        ),
      );

  AppBar _appBar({required BuildContext context, required SurahModel surah}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      title: Text(
        surah.namaLatin,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
