import 'package:flutter/material.dart';

class ImageActionsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container untuk ikon gambar dengan border
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
              style: BorderStyle.solid,
            ),
          ),
          child: Icon(
            Icons.image_outlined,
            size: 100,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        
        // Tombol Kamera dan Galeri
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.camera_alt, color: Colors.black),
              label: Text('Camera', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.photo, color: Colors.black),
              label: Text('Gallery', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        
        // Tombol Hapus Gambar
        ElevatedButton(
          onPressed: () {},
          child: Text('Hapus Gambar', style: TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,        // Mengganti primary dengan backgroundColor
            foregroundColor: Colors.white,        // Mengganti onPrimary dengan foregroundColor
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
