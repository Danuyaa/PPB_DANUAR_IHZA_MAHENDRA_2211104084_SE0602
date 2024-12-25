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

## A. Google Maps API

Google Maps API membantu developer membuat aplikasi berbasis peta dengan fitur seperti marker, route, dan pencarian tempat.

### Langkah-Langkah Implementasi:
1. **Dapatkan API Key**:  
   - Buat API key di [Google Cloud Console](https://cloud.google.com/maps-platform/).  
   - Aktifkan Google Maps SDK untuk Android dan iOS.  

2. **Set Min SDK di Android**:  
   Tambahkan minimum SDK di `android/app/build.gradle`:  
   ```groovy
   android {  
       defaultConfig {  
           minSdkVersion 20  
       }  
   }
   ```

3. **Tambahkan API Key ke Manifest**:  
   Tambahkan ke file `AndroidManifest.xml`:  
   ```xml
   <meta-data android:name="com.google.android.geo.API_KEY"
              android:value="YOUR_KEY_HERE" />
   ```

4. **Konfigurasi iOS**:  
   Tambahkan API key di `AppDelegate.m` (Obj-C) atau `AppDelegate.swift` (Swift).

---

## B. Menambah Package Google Maps

1. Tambahkan package `google_maps_flutter` melalui [pub.dev](https://www.pub.dev).  
2. Update file `pubspec.yaml`.  
3. Import package ke file Dart:  
   ```dart
   import 'package:google_maps_flutter/google_maps_flutter.dart';
   ```

4. Tambahkan widget GoogleMap:  
   ```dart
   GoogleMap(
       initialCameraPosition: _kInitialPosition,
   );
   ```

5. Atur lokasi default:  
   ```dart
   static final LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
   static final CameraPosition _kInitialPosition = CameraPosition(
       target: _kMapCenter,
       zoom: 11.0,
   );
   ```

6. Contoh kode lengkap:
   ```dart
   import 'package:flutter/material.dart';
   import 'package:google_maps_flutter/google_maps_flutter.dart';

   class MapsScreen extends StatefulWidget {
       @override
       _MapsScreenState createState() => _MapsScreenState();
   }

   class _MapsScreenState extends State<MapsScreen> {
       static final LatLng _kMapCenter = LatLng(19.018255973653343, 72.84793849278007);
       static final CameraPosition _kInitialPosition = CameraPosition(
           target: _kMapCenter,
           zoom: 11.0,
       );

       @override
       Widget build(BuildContext context) {
           return Scaffold(
               appBar: AppBar(
                   title: Text('Google Maps Demo'),
               ),
               body: GoogleMap(
                   initialCameraPosition: _kInitialPosition,
                   myLocationEnabled: true,
               ),
           );
       }
   }
   ```

---

## C. Menampilkan Lokasi Pengguna

Ubah `myLocationEnabled` menjadi `true`:
```dart
GoogleMap(
    initialCameraPosition: _kInitialPosition,
    myLocationEnabled: true,
);
```

---

## D. Menambahkan Marker pada Peta

Gunakan kode berikut untuk menampilkan marker:
```dart
Set<Marker> _createMarker() {
    return {
        Marker(
            markerId: MarkerId("marker_1"),
            position: _kMapCenter,
            infoWindow: InfoWindow(title: 'Marker 1'),
            rotation: 90,
        ),
        Marker(
            markerId: MarkerId("marker_2"),
            position: LatLng(-6.9733165, 107.6281415),
        ),
    };
}
```

---

## E. Place Picker

Tambahkan package `place_picker` di `pubspec.yaml`:
```dart
import 'package:place_picker/place_picker.dart';
```

Buat method untuk menggunakan Place Picker:
```dart
void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
            "YOUR_API_KEY",
            displayLocation: customLocation,
        ),
    ));

    print(result); // Handle hasil sesuai kebutuhan
}
```
- models/product.dart
```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapsScreen extends StatefulWidget {
 @override
 _MapsScreenState createState() => _MapsScreenState();
}
class _MapsScreenState extends State<MapsScreen> {
 static final LatLng _kMapCenter =
 LatLng(19.018255973653343, 72.84793849278007);
 static final CameraPosition _kInitialPosition = CameraPosition(
 target: _kMapCenter,
 zoom: 11.0,
 );
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: Text('Google Maps'),
 ),
 body: GoogleMap(
 initialCameraPosition: _kInitialPosition,
 myLocationEnabled: true,
 ),
 );
 }
}
```
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:modul_12/my_maps.dart';

void main() {
  runApp(const MyApp());
}

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
      home: MapsScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { 
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,        
        title: Text(widget.title),
      ),
      body: Center(
        
        
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

```

  


---

**Output**

![image](https://github.com/user-attachments/assets/0108db42-36e3-4de9-a804-468ff5a6389e)

---
# UNGUIDED
---
Dari tugas guided yang telah dikerjakan, lanjutkan hingga ke bagian place picker untuk
memberikan informasi mengenai lokasi yang ditunjuk di peta.
---

homepage.dart
```
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

class MyMaps extends StatefulWidget {
  @override
  _MyMapsState createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static final LatLng _kMapCenter = LatLng(-7.4350516, 109.2496451);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {},
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlacePicker(
                      apiKey:
                          'AIzaSyBlXqXM8m1f5CGck5O85Z1LTt91YUUyf5I', 
                      initialLocation: _kMapCenter,
                    ),
                  ),
                );

                if (result != null) {
                  print('Selected Place: ${result.formattedAddress}');
                }
              },
              child: Text("Pick a Place"),
            ),
          ),
        ],
      ),
    );
  }
}
```

main.dart
```
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMaps extends StatefulWidget {
  const MyMaps({super.key});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
    );
  }
}
```

**Output**

![image](https://github.com/user-attachments/assets/aa9a12c3-7ac5-4a37-8cc7-4a86325e40b3)

---



---

