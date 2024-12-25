<div align="center">

**LAPORAN PRATIKUM** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL XI** <br>

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


**1. Firebase Cloud Messaging**
---
Firebase Cloud Messaging (FCM) adalah layanan yang digunakan untuk mengirimkan notifikasi dengan
mudah ke banyak pengguna sekaligus. Dengan FCM, Kita dapat mengirimkan pesan baik ke perangkat
individu maupun ke grup pengguna yang berlangganan topik tertentu. Dokumentasi lengkapnya dapat
diakses di https://firebase.google.com/docs/flutter/setup?platform=android
Agar dapat mengirim pesan, Kita perlu:
1. Mendapatkan token unik dari setiap perangkat pengguna.
2. Atau mengelompokkan pengguna berdasarkan topik tertentu (misalnya "promo" atau
"berita").
Setelah itu, notifikasi dapat dikirim menggunakan Firebase Cloud Functions.

**2. Jenis Pesan pada Firebase Cloud Messaging (FCM)**
---
FCM memiliki dua jenis pesan utama yang digunakan untuk kebutuhan notifikasi, yaitu:
1) Notification Message
Pesan ini digunakan untuk langsung menampilkan notifikasi di perangkat pengguna.
Cara kerja:
- Jika aplikasi berjalan di latar depan (foreground), pesan diteruskan ke fungsi onMessage
untuk diproses.
- Jika aplikasi di latar belakang (background) atau dimatikan (terminated), notifikasi akan
langsung muncul di tray notifikasi perangkat tanpa memerlukan kode tambahan.
2) Data Message
Pesan ini memberikan lebih banyak fleksibilitas karena isinya tidak langsung ditampilkan
sebagai notifikasi.
Cara kerja:
- Pesan ini akan diproses oleh aplikasi, baik saat aplikasi aktif maupun tidak aktif.
- Untuk menampilkan notifikasi ke pengguna, Kita perlu menambahkan kode khusus,
biasanya menggunakan plugin seperti flutter_local_notifications.


**3. Praktikum**
---
**main.dart**
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:laprak11/my_notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description: 'This channel is used for important notifications.', // Deskripsi
  importance: Importance.high, // Prioritas
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyNotificationScreen(),
    );
  }
}

```


---


**my_notification_screen.dart**
```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:laprak11/main.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  @override
  void initState() {
    super.initState();
    // Membuat pengaturan inisialisasi notifikasi untuk Android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);

    // Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // Jika notifikasi tersedia, tampilkan menggunakan notifikasi lokal
      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode, // ID notifikasi (hashCode untuk unik)
          notification.title, // Judul notifikasi
          notification.body, // Isi notifikasi
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: "@mipmap/ic_launcher",
            ),
          ),
        );
      }
    });

    // Menangani aksi ketika notifikasi dibuka
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // Jika notifikasi tersedia, tampilkan dialog
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""), // Judul dialog
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? "")], // Isi dialog
                ),
              ),
            );
          },
        );
      }
    });
    // Memanggil metode untuk mengambil token FCM perangkat
    getToken();
  }

  // Metode untuk mendapatkan token FCM
  void getToken() async {
    token = await FirebaseMessaging.instance
        .getToken(); // Mendapatkan token FCM perangkat
    print('FCM Token: $token'); // Menampilkan token di log
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notification'),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text('halaman untuk menerima notifikasi'),
      ),
    );
  }
}


```
**FireBase Messaging**
-
![Gambar WhatsApp 2024-12-25 pukul 19 35 05_4a9b675a](https://github.com/user-attachments/assets/de337d26-ce18-4d2d-9f1f-370575bace8c)
---


**Output**

![Screenshot 2024-11-27 164622](https://github.com/user-attachments/assets/12370968-85ee-40a7-9241-47ea4f884742)

---

![Gambar WhatsApp 2024-12-25 pukul 19 26 13_4843bf93](https://github.com/user-attachments/assets/f1370b54-e24f-4e1c-b45e-92ff8255c418)



# UNGUIDED
**Modifikasi Guided diatas bisa menampilkan Nama, Nim, Kelas, dan Prodi kalian ke dalam
Notifikasi Flutter Cloud Messaging dan landing page notifikasinya.**

**Output**
![Gambar WhatsApp 2024-12-25 pukul 19 35 24_a0107055](https://github.com/user-attachments/assets/b56a9955-25d2-4123-8ec3-852e620dcd63)

![Gambar WhatsApp 2024-12-25 pukul 19 34 18_92613f00](https://github.com/user-attachments/assets/0160ad84-faf2-49c1-ae73-ff1899868215)

