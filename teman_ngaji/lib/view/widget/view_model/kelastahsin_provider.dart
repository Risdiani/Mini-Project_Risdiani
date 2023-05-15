import 'package:flutter/material.dart';

class ImageName extends ChangeNotifier {
  List<String> imageName = [
    'assets/kelas1.png',
    'assets/kelas2.png',
    'assets/kelas3.png'
  ];

  List<String> get image => imageName;

  void add(ImageName image) {
    image.add(image);
    notifyListeners();
  }
}
