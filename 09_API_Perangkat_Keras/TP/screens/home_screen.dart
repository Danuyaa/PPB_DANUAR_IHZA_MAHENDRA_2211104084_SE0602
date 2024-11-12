import 'package:flutter/material.dart';
import '../widgets/image_actions_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Memilih Gambar'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ImageActionsContainer(),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
