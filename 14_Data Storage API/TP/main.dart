import 'package:flutter/material.dart';
import 'pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
