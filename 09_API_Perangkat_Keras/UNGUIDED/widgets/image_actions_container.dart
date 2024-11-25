import 'dart:io'; // Untuk file system
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Plugin image_picker

class ImageActionsContainer extends StatefulWidget {
  @override
  _ImageActionsContainerState createState() => _ImageActionsContainerState();
}

class _ImageActionsContainerState extends State<ImageActionsContainer> {
  File? _imageFile; // Menyimpan file gambar yang dipilih

  final ImagePicker _picker = ImagePicker(); // Instance image picker

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> _pickImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  // Fungsi untuk mengambil gambar dari galeri
  Future<void> _pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  // Fungsi untuk menghapus gambar
  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container untuk gambar atau ikon
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
          child: _imageFile == null
              ? Icon(
                  Icons.image_outlined,
                  size: 100,
                  color: Colors.grey,
                )
              : Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
        ),
        SizedBox(height: 20),

        // Tombol Kamera dan Galeri
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: _pickImageFromCamera,
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
              onPressed: _pickImageFromGallery,
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
          onPressed: _clearImage,
          child: Text('Hapus Gambar', style: TextStyle(fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
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
