import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/model/surah_model.dart';
import 'package:teman_ngaji/utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teman_ngaji/view/screen/detail_quran_screen.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<SurahModel>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahModel>>(
        future: _getSurahList(),
        initialData: const [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('no data');
          }
          return ListView.separated(
              itemBuilder: (context, index) => _surahItem(
                  surah: snapshot.data!.elementAt(index), context: context),
              separatorBuilder: ((context, index) =>
                  Divider(color: background.withOpacity(.35))),
              itemCount: snapshot.data!.length);
        }));
  }

  Widget _surahItem(
          {required SurahModel surah, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailQuran(
                    nomorSurat: surah.nomor,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/nomor-surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text("${surah.nomor} ",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.namaLatin,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "${surah.jumlahAyat} Ayat",
                        style: GoogleFonts.poppins(
                            color: button,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              )),
              Text(
                surah.nama,
                style: GoogleFonts.amiri(
                    color: background,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
