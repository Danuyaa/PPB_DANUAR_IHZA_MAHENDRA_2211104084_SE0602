import 'package:flutter/material.dart';
import 'package:modul_5/flexibel_extended.dart';
//import 'package:modul_5/Costom.dart';
//import 'package:modul_5/jenis_list_viwe.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlexibleExpandedScreen(),
      //JenisListView(), 
      //Custom(), 
      
   );
  }
}
