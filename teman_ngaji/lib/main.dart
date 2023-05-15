import 'package:flutter/material.dart';
import 'package:teman_ngaji/view/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:teman_ngaji/view/widget/view_model/kelastahsin_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ImageName())],
      child: MaterialApp(
        title: 'Teman Ngaji App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
