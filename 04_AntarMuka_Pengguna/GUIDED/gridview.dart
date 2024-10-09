import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(Icons.account_balance)
              ],
            ),
            color: Colors.amberAccent,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('LL'),
            color: const Color.fromARGB(255, 217, 64, 255),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('OO'),
            color: const Color.fromARGB(255, 255, 64, 64),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('VV'),
            color: const Color.fromARGB(255, 64, 255, 134),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('EE'),
            color: const Color.fromARGB(255, 64, 255, 245),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('UU'),
            color: const Color.fromARGB(255, 255, 64, 226),
          ),
        ],
      ),
    );
  }
}