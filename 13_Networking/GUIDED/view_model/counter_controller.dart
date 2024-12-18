import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void incrementCounter() {
    counter++;
    getSnackbar('Counter Updated', 'Counter increased to $counter');
  }

  void decrementCounter() {
    counter--;
    getSnackbar('Counter Updated', 'Counter decreased to $counter');
  }

  void getSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void getDialog() {
    Get.defaultDialog(
      title: 'Dialog Title',
      middleText: 'This is a dialog message.',
      backgroundColor: Colors.white,
      titleStyle: TextStyle(color: Colors.black),
      middleTextStyle: TextStyle(color: Colors.black),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Menutup dialog
          },
          child: Text('Close', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  void getBottomSheetView() {
    Get.bottomSheet(
      Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity, // Mengisi lebar bottom sheet
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bottom Sheet Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('This is a bottom sheet message.'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Menutup bottom sheet
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
      isDismissible: true,
    );
  }

  // Fungsi untuk mendapatkan tampilan Sidebar Menu
  Widget getSidebar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Get.back(); // Menutup drawer
            },
          ),
          ListTile(
            title: Text('Detail'),
            onTap: () {
              Get.toNamed('/details'); // Navigasi ke DetailPage
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Get.back(); // Menutup drawer
              // Tambahkan logika untuk navigasi ke pengaturan jika diperlukan
            },
          ),
        ],
      ),
    );
  }
}