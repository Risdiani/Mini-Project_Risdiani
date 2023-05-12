import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teman_ngaji/model/surah_model.dart';

class ApiSurah {
  static const String baseUrl = 'https://equran.id/api';
  static const String surah = '/surat';

  static Future<List<SurahModel>> getAllSurah() async {
    final response = await http.get(Uri.parse('$baseUrl$surah'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<SurahModel> surah =
          body.map((e) => SurahModel.fromJson(e)).toList();
      return surah;
    } else {
      throw "Can't get the data";
    }
  }
}
