import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teman_ngaji/utils/theme.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      username = logindata.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            Text(
              username,
              style: GoogleFonts.poppins(
                color: background,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kelas Saya',
                        style: GoogleFonts.poppins(fontSize: 17),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.poppins(fontSize: 17),
                      ),
                      const Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      logindata.setBool('login', true);
                      logindata.remove('username');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      decoration: BoxDecoration(
                          color: button,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
