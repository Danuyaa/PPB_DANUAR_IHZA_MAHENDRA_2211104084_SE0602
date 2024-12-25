<div align="center">

**LAPORAN PRATIKUM** <br>
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
# GUIDED
State management dalam Flutter adalah proses mengelola state atau status dari aplikasi, yaitu data atau informasi yang dapat berubah sepanjang siklus hidup aplikasi. State ini mencakup segala hal yang memengaruhi tampilan antarmuka pengguna (UI), seperti input pengguna, data dari API, dan status internal widget. Ketika aplikasi semakin kompleks dibuat, maka pasti akan ada saatnya dimana harus dibagikan state aplikasi ke berbagai halaman yang ada.  Flutter adalah deklaratif, sehingga Flutter membangun user interface berdasarkan state saat ini. Dengan menggunakan state management, dapat dilakukan sentralisasi semua state dari berbagai macam UI Control untuk mengendalikan aliran data lintas aplikasi. State management penting karena aplikasi Flutter sering kali terdiri dari banyak widget yang saling terkait. Dengan mengelola state dengan baik, kita dapat memastikan :  

1) Sinkronisasi UI dan data, karena selalu mencerminkan data terkini. 
2) Organisasi kode yang baik untuk mempermudah pengembangan dan pemeliharaan. 
3) Pengurangan bug, karena state yang dikelola dengan benar mengurangi kemungkinan terjadinya bug.
   
---
**Praktikum**
---
view/detail_page.dart

```dart
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('halaman detail'),
      ),
      body: Center(
        child: Text('halaman detail'),
      ),
    );
  }
}
```

view/my_home_page.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${controller.counter}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/detail');
                      // Get.to(DetailPage());
                    },
                    child: Text('go to detail'))
              ],
            )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: controller.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
              onPressed: controller.getsnackbar,
              child: const Icon(Icons.add_alert)),
          FloatingActionButton(
              onPressed: controller.getdialog,
              child: const Icon(Icons.notification_add_rounded)
          ),
          FloatingActionButton(
              onPressed: controller.getbottomsheet,
              child: const Icon(Icons.arrow_upward)
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```

view_model/counter_controller.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter = 0.obs;
  
  void increment(){
    counter++;
    
  }

  void decrement(){
    counter--;
  }
  
  void getsnackbar(){
    Get.snackbar(
     "Getx Snackbar",
     "Ini Snackbar", 
     colorText: Colors.white, 
     backgroundColor: Colors.green
    );
  }

  void getdialog(){
    Get.defaultDialog(
      title: "Getx Dialog",
      middleText: "Ini Dialog",
      backgroundColor: Colors.green
    );
  }

  void getbottomsheet(){
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.green,
        child: Center(
          child: Text("Getx BottomSheet"),
        ),
      )
    );
  }
}
```

main.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view/detail_page.dart';
import 'package:guided/view/my_home_page.dart';

import 'view_model/counter_controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/',
        page: () => MyHomePage(title: 'Belajar GetX'),
      ),
        GetPage(name: '/detail',
        page: () => DetailPage(),
      ),
      ],
    );
  }
}

```
---
**Output**
--
![image](https://github.com/user-attachments/assets/f52e431d-0982-4155-856b-c5570d80c47f)
![image](https://github.com/user-attachments/assets/54b0373b-9267-40ae-835c-dfac44d3107f)
![image](https://github.com/user-attachments/assets/afdaac3a-04d1-4c66-b83f-934344e1f2ef)
![image](https://github.com/user-attachments/assets/b6a1c1ca-30a6-4a82-b5f5-cec56e654fb8)

---

# UNGUIDED

main.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/add_screen.dart';
import 'package:unguided/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddScreen())
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,

      ),
    );
  }
}
```

home_screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AddController noteController = Get.put(AddController());  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unguided Note App'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return Center(
            child: Text('Tidak ada catatan', style: TextStyle(fontSize: 20),),
          );
        }
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(note['title'] ?? ''),
                subtitle: Text(note['description'] ?? ''),
                trailing: IconButton(
                  onPressed: () => noteController.confirmDelete(context, index),
                  icon: Icon(Icons.delete, color: Colors.blue,)
                ),
              ),
            );
          }
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
```

add_screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unguided/controller.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final AddController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',  
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {
                  noteController.addNote(title, description);
                  Get.back();
                } else {
                  noteController.snackBar();
                }
              },
              child: 
                Text('Simpan', style: TextStyle(color: Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue
                ),
            )
          ],
        ),
      ),
    );
  }
}
```

controller.dart

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }

  void snackBar() {
    Get.snackbar(
      'Tidak dapat menyimpan', 'harap isi dengan benar',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
    );
  }

  void confirmDelete(BuildContext context, int index) {
    Get.defaultDialog(
      title: 'Konfirmasi Hapus',
      middleText: 'Apakah yakin untuk menghapus catatan ini?',
      textConfirm: 'Hapus',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      onConfirm: () {
        notes.removeAt(index);
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Catatan berhasil dihapus',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10)
        );
      },
      onCancel: () {
      },
    );
  }
}
```

---
**Output**
--
![image](https://github.com/user-attachments/assets/d9d3ebb1-81d3-441c-96d4-01ab01305cd0)
![image](https://github.com/user-attachments/assets/f4cb9eef-6255-4587-adb0-42d4987c7ef3)
![image](https://github.com/user-attachments/assets/49d95bb9-1333-4127-a434-941661c7b4b8)
![image](https://github.com/user-attachments/assets/c8654be7-d42a-4ede-8add-7bce4e3efac2)
