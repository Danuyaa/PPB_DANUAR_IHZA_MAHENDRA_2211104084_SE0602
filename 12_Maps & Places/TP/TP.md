<div align="center">

**TUGAS PENDAHULUAN** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL XII** <br>

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

# Integrasi Google Maps di Flutter

## **1. Menambahkan Google Maps Package**
### a. Nama Package dan Langkah-Langkah:
Nama package yang digunakan: **`google_maps_flutter`**.

Langkah-langkah untuk menambahkan package Google Maps:
1. **Tambahkan dependensi di `pubspec.yaml`:**
   ```yaml
   dependencies:
     google_maps_flutter: ^2.2.5
   ```
   (Pastikan menggunakan versi terbaru dari package.)

2. **Jalankan perintah untuk menginstal package:**
   ```bash
   flutter pub get
   ```

3. **Konfigurasi Platform:**
   - **Android:**
     - Tambahkan API Key di file `android/app/src/main/AndroidManifest.xml`:
       ```xml
       <meta-data
           android:name="com.google.android.geo.API_KEY"
           android:value="YOUR_API_KEY_HERE"/>
       ```

   - **iOS:**
     - Tambahkan API Key di file `ios/Runner/AppDelegate.swift` atau `Info.plist`:
       ```xml
       <key>GMSApiKey</key>
       <string>YOUR_API_KEY_HERE</string>
       ```

### b. Mengapa Perlu API Key?
API Key digunakan untuk mengotentikasi aplikasi Anda agar dapat menggunakan layanan Google Maps. 
API Key tersebut diatur pada **Google Cloud Console**, di mana Anda harus mengaktifkan **Google Maps API** untuk proyek Anda.

---

## **2. Menampilkan Google Maps**
### a. Kode untuk Menampilkan Google Map:
Berikut adalah contoh kode:
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleMapScreen(),
    );
  }
}

class GoogleMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps Example')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.2088, 106.8456), // Jakarta
          zoom: 14.0,
        ),
      ),
    );
  }
}
```

### b. Menentukan Posisi Awal Kamera:
Gunakan properti **`initialCameraPosition`** pada widget `GoogleMap`. Contohnya:
```dart
initialCameraPosition: CameraPosition(
  target: LatLng(-6.2088, 106.8456), // Koordinat awal
  zoom: 14.0,
),
```

### c. Properti Utama dari Widget `GoogleMap`:
1. **`initialCameraPosition`:** Menentukan posisi awal kamera.
2. **`markers`:** Daftar marker yang ditampilkan di peta.
3. **`onMapCreated`:** Callback saat peta berhasil diinisialisasi.
4. **`mapType`:** Menentukan tipe peta, misalnya `MapType.normal` atau `MapType.satellite`.
5. **`zoomControlsEnabled`:** Mengatur apakah kontrol zoom terlihat.
6. **`myLocationEnabled`:** Menampilkan lokasi pengguna saat ini.

---

## **3. Menambahkan Marker**
### a. Kode untuk Menambahkan Marker:
```dart
Set<Marker> _markers = {
  Marker(
    markerId: MarkerId('jakarta'),
    position: LatLng(-6.2088, 106.8456),
    infoWindow: InfoWindow(
      title: 'Jakarta',
      snippet: 'Ibu Kota Indonesia',
    ),
  ),
};

@override
Widget build(BuildContext context) {
  return GoogleMap(
    initialCameraPosition: CameraPosition(
      target: LatLng(-6.2088, 106.8456),
      zoom: 14.0,
    ),
    markers: _markers,
  );
}
```

### b. Menampilkan Info Window Saat Marker Diklik:
Info Window ditampilkan dengan properti **`infoWindow`** dalam `Marker`:
```dart
Marker(
  markerId: MarkerId('jakarta'),
  position: LatLng(-6.2088, 106.8456),
  infoWindow: InfoWindow(
    title: 'Jakarta',
    snippet: 'Ibu Kota Indonesia',
  ),
  onTap: () {
    print('Marker Jakarta diklik!');
  },
);
```

---

## **4. Menggunakan Place Picker**
### a. Apa itu Place Picker?
Place Picker adalah fitur untuk memilih lokasi dari peta yang ditampilkan kepada pengguna. Paket populer untuk implementasi di Flutter adalah **`flutter_google_places`** atau **`google_maps_place_picker`**.

### b. Kode untuk Menampilkan Place Picker:
Gunakan package **`google_maps_place_picker`**:
1. Tambahkan dependensi:
   ```yaml
   dependencies:
     google_maps_place_picker: ^3.0.1
   ```

2. Contoh Kode:
   ```dart
   import 'package:flutter/material.dart';
   import 'package:google_maps_place_picker/google_maps_place_picker.dart';
   import 'package:google_maps_flutter/google_maps_flutter.dart';

   void main() => runApp(MyApp());

   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home: PlacePickerScreen(),
       );
     }
   }

   class PlacePickerScreen extends StatelessWidget {
     final String apiKey = "YOUR_API_KEY_HERE";

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text("Place Picker")),
         body: ElevatedButton(
           onPressed: () async {
             final PickResult? result = await Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => PlacePicker(apiKey),
               ),
             );

             if (result != null) {
               print("Latitude: ${result.geometry!.location.lat}");
               print("Longitude: ${result.geometry!.location.lng}");
             }
           },
           child: Text("Pilih Lokasi"),
         ),
       );
     }
   }
   ```

Kode ini akan membuka Place Picker dan mengembalikan koordinat lokasi yang dipilih oleh pengguna.

