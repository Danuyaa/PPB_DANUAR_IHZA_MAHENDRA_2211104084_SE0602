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

## A. Tugas Mandiri
Soal: Buatlah satu project untuk menampilkan beberapa produk dan halaman
e-commerce dengan menerapkan class model serta navigasi halaman.

**Input**

- models/product.dart
```dart
class Product {
  final String id; 
  final String name;
  final String description; 
  final double price; 
  final String imageUrl; 

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

```
- pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', 
    name: 'Mouse Gaming', 
    description: 'Gacor Buat Main Game', 
    price: 100.00, 
    imageUrl: 'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1'),
     
    Product(id: '2', 
    name: 'Keyboard Gaming', 
    description: 'Gacor Buat Main Game', 
    price: 150.00, 
    imageUrl: 'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commerce App"),
        backgroundColor:  Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: products.length,
          itemBuilder: (ctx, i) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => ProductDetailPage(product: products[i]),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ));
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      products[i].imageUrl,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[i].name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Rp${products[i].price}",
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```
- pages/product_detail_page.dart
```dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.indigo, 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    product.imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.name,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 10),
              Text(
                "Rp${product.price}",
                style: TextStyle(fontSize: 22, color: Colors.amber[700], fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                product.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700], 
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Tambahkan ke Keranjang",
                    style: TextStyle(fontSize: 16, color: Colors.indigo), 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:modul_77/pages/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

```

---

**Output**

![Cuplikan layar 2024-11-05 232723](https://github.com/user-attachments/assets/dd026123-2ce5-4d18-a719-db9fd99e24b4)
![Cuplikan layar 2024-11-05 232805](https://github.com/user-attachments/assets/d172ff69-7265-4b40-b39c-df5884b820c5)
![Cuplikan layar 2024-11-05 232741](https://github.com/user-attachments/assets/cdc180dd-9a9a-419f-89e4-1ffc7c935e06)


---

