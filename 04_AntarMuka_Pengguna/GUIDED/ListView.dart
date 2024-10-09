import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pratikum 4'),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Column(
        children: <Widget>[
        Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A')),
        ),
        Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B'))),
        Container(
        height: 50,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry C')),
        ),
        ],
      ),
    );
  }
}