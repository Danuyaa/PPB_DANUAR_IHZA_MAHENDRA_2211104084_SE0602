import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rekomendasi Wisata Banyumas'),
          backgroundColor: const Color.fromARGB(255, 228, 164, 185),
        ),
        body: TempatWisataList(),
      ),
    );
  }
}

class TempatWisataList extends StatelessWidget {
  final List<Map<String, String>> tempatWisata = [
    {
      'nama': 'Air Terjun Jumog',
      'gambar': 'https://asset.kompas.com/crops/4-RnYBaE_3TwXGs2zRidga4An9A=/0x7:800x540/750x500/data/photo/2018/11/23/2224178843.jpg',
      'deskripsi': 'Air Terjun Jumog adalah salah satu air terjun yang terkenal di Banyumas. Suasananya yang sejuk dan pemandangannya yang indah menjadikannya tempat yang ideal untuk berwisata alam.',
    },
  
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tempatWisata.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tempatWisata[index]['nama']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Image.network(
                tempatWisata[index]['gambar']!,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tempatWisata[index]['deskripsi']!,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi saat tombol diklik
                },
                child: Text('Kunjungi Sekarang'),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
