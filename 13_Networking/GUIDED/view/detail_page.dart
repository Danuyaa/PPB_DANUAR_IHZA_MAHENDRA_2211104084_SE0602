import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_13/view_model/counter_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller =
        Get.find(); // Mengambil instance CounterController

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Halaman Detail'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Info',
                  'This is a detail page.',
                  snackPosition:
                      SnackPosition.TOP, // Mengubah posisi snackbar ke atas
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Text('Show Snackbar'),
            ),
            SizedBox(height: 20),
            Text(
                'Current Counter: ${controller.counter}'), // Menampilkan counter
          ],
        ),
      ),
    );
  }
}