import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_13/view/detail_page.dart';
import 'package:modul_13/view/my_home_page.dart'; // Import DetailPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Guided 13 - Networking',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage(title: 'Halaman Beranda')),
        GetPage(name: '/details', page: () => const DetailPage()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
