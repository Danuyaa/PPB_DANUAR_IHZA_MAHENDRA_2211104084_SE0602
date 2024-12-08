<div align="center">

**TUGAS PENDAHULUAN** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL XIII** <br>

<img src="https://github.com/user-attachments/assets/637271ab-0240-4561-a7a6-04cb1169f636" alt="Logo Vertikal Telkom University" width="350"/>

**DANUAR IHZA MAHENDRA (2211104084)**  
**SE06-02**

Asisten Praktikum :  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

Dosen Pengampu :  
Yudha Islami Sulistya, S.Kom., M.Cs

PROGRAM STUDI S1 REKAYASA PERANGKAT LUNAK  
FAKULTAS INFORMATIKA  
TELKOM UNIVERSITY PURWOKERTO  
2024

</div>

---

# TUGAS PENDAHULUAN

## 1. Apa yang dimaksud dengan state management pada Flutter?
State management pada Flutter adalah cara untuk mengelola dan mempertahankan status aplikasi, termasuk data yang perlu diubah atau diperbarui selama aplikasi berjalan. Ini mencakup bagaimana komponen UI berinteraksi dengan data tersebut. State management memungkinkan pemisahan logika bisnis dari UI, memastikan pengelolaan status yang lebih terstruktur dan efisien.

## 2. Sebut dan jelaskan komponen-komponen yang ada di dalam GetX.
GetX adalah framework state management di Flutter yang ringan dan powerful. Komponen-komponen utamanya meliputi:
- **State Management**: Mengelola perubahan data secara reaktif dengan `Obx` atau `GetBuilder`.
- **Route Management**: Pengelolaan navigasi tanpa context melalui `Get.to()`, `Get.off()`, dll.
- **Dependency Injection**: Mempermudah pengelolaan dependensi dengan cara instansiasi otomatis menggunakan `Get.put()` dan `Get.lazyPut()`.

## 3. Lengkapi kode berikut ini, tampilkan outputnya, dan jelaskan:

### Kode Lengkap:
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel untuk menyimpan nilai counter
  var counter = 0.obs;

  // Fungsi untuk menambah nilai counter
  void increment() => counter++;

  // Fungsi untuk mereset nilai counter
  void reset() => counter.value = 0;
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(() {
          // Menampilkan nilai counter secara reaktif
          return Text(
            "\${controller.counter.value}",
            style: TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Menambah nilai counter
              controller.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Mereset nilai counter
              controller.reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
```

### Deskripsi Program:
Program ini adalah aplikasi Flutter sederhana dengan fitur penghitung (counter) menggunakan state management GetX. Program memiliki komponen sebagai berikut:
1. **Controller**: `CounterController` mengelola nilai counter dengan menggunakan variabel `counter` yang reaktif.
2. **UI**: Halaman utama menampilkan nilai counter menggunakan widget `Obx`, sehingga perubahan nilai langsung diperbarui pada layar.
3. **Fungsi**: Dua tombol disediakan, satu untuk menambah nilai counter dan satu lagi untuk mereset ke nol. Tombol diimplementasikan dengan widget `FloatingActionButton`.
4. **Reaktivitas**: Nilai counter diperbarui secara real-time berkat pendekatan reactive programming dari GetX.
5. **Output**: Pengguna melihat angka yang terus meningkat setiap kali tombol tambah ditekan dan kembali ke nol ketika tombol reset ditekan.

### Output:
![image](https://github.com/user-attachments/assets/ae8f8677-99ba-4372-b9d8-b4cdd2cf69cc)


