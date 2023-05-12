import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teman_ngaji/view/screen/profile_screen.dart';
import 'package:teman_ngaji/utils/theme.dart';
import 'package:teman_ngaji/view/widget/kajian.dart';
import 'package:teman_ngaji/view/widget/kelas_tahsin.dart';
import 'package:teman_ngaji/view/widget/quran.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences logindata;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.get('username').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'Home',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: (() => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileScreen()))
                      }),
                  icon: const Icon(Icons.person_2_outlined))
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Assalamualaikum,',
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF263A29)),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            username,
            style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF263A29)),
          ),
          const SizedBox(
            height: 10,
          ),
          const QuranWidget(),
          const SizedBox(
            height: 5,
          ),
          const KelasTahsin(),
          const SizedBox(
            height: 5,
          ),
          const KajianWidget(),
        ]),
      ),
    );
  }
}
