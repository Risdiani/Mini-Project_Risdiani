import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';
import 'package:teman_ngaji/tab/doa_tab.dart';

import '../../tab/playlist_tab.dart';

import '../../tab/surah_tab.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          title: Text(
            'Quran',
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _lastRead(),
                      ),
                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        elevation: 0,
                        backgroundColor: green,
                        shape: Border(
                            bottom: BorderSide(
                                width: 3,
                                color:
                                    const Color(0xFFAAAAAA).withOpacity(.5))),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: _tab(),
                        ),
                      )
                    ],
                body: const TabBarView(
                  children: [SurahTab(), PlaylistTab(), DoaTab()],
                )),
          ),
        ));
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: text,
      labelColor: Colors.white,
      indicatorColor: green,
      indicatorWeight: 3,
      tabs: [
        _tabItem(label: 'Surah'),
        _tabItem(label: 'Playlist'),
        _tabItem(label: 'Doa'),
      ],
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              color: background,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/baca.png'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Terakhir Dibaca',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Ali Imran',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat 185',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
