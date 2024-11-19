import 'package:flutter/material.dart';
import 'package:praktikum/camera_screen.dart';
import 'package:praktikum/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:

          // MyCameraScreen()

          ImagePickerScreen(
        ImageSourceType.gallery,
      ),
    );
  }
}
