import 'package:flutter/material.dart';
import 'dart:io'; // Menambahkan import untuk File

class DisplayScreen extends StatelessWidget {
  final String imagePath; // Perbaikan nama variabel untuk konsistensi

  const DisplayScreen({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            // Menambahkan tombol untuk berbagi gambar
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implementasi fungsi berbagi bisa ditambahkan di sini
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              fit: BoxFit
                  .contain, // Menambahkan BoxFit untuk tampilan yang lebih baik
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman kamera
                  },
                  child: const Text('Take Another Photo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implementasi fungsi simpan bisa ditambahkan di sini
                  },
                  child: const Text('Save Photo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}