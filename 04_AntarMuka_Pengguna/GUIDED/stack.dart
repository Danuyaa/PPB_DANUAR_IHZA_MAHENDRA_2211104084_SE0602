import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pratikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Stack(
          children:[
          Container(
          width: 100,
          height: 100,
          color: Colors.red,
          ),Container(
          width: 90,
          height: 90,
          color: Colors.green,
          ),
          Container(
          width: 80,
          height: 80,
          color: Colors.blue,
          )
         ]
      ),
       

    );
  }
}