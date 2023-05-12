import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teman_ngaji/utils/theme.dart';

class DaftarKelas extends StatefulWidget {
  const DaftarKelas({super.key});

  @override
  State<DaftarKelas> createState() => _DaftarKelasState();
}

class _DaftarKelasState extends State<DaftarKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          title: Text(
            'Daftar Kelas',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              final List kelas = [
                'Tahmidi/Persiapan',
                'Awwal',
                'Talaqqi Dasar',
                'Talaqqi Lanjutan',
                'Ilmu Tajwid',
                'Konsentrasi Talaqqi',
                'Konsentrasi Matan Tuhfatul Athfal',
                'Konsentrasi Matan Jazari',
              ];
              return Card(
                color: green,
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text('Kelas ${kelas[index]}'),
                ),
              );
            }));
  }
}
