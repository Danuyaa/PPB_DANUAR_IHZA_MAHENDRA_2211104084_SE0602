import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabbarState();
}

class _MyTabbarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu tab bar"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.food_bank),
              text: "Menu",
              ),
            Tab(
              icon: Icon(Icons.calendar_month),
              text: "Calender",
              ),
            Tab(
              icon: Icon(Icons.history),
              text: "History",
              ),
          ]),
          backgroundColor: const Color.fromARGB(238, 7, 226, 255),
        ),
        body: const TabBarView(children: [
          Center(
            child: Text("Ini konten Menu"),
          ),
            Center(
            child: Text("Ini konten Calender"),
          ),
          Center(
            child: Text("Ini konten History"),
          ),
        ])
      ),

    );
  }
}