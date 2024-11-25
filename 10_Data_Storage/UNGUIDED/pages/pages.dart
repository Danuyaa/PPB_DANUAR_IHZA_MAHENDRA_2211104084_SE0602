import 'package:flutter/material.dart';
import 'package:modul_10/helper/db_helper.dart';
import 'package:modul_10/models/mahasiswa.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Mahasiswa> _mahasiswaList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Mengambil data mahasiswa dari database
  _loadData() async {
    List<Mahasiswa> mahasiswaList = await _dbHelper.getAllMahasiswa();
    setState(() {
      _mahasiswaList = mahasiswaList;
    });
  }

  // Menambahkan data mahasiswa
  _addMahasiswa() async {
    if (_namaController.text.isNotEmpty &&
        _nimController.text.isNotEmpty &&
        _alamatController.text.isNotEmpty &&
        _hobiController.text.isNotEmpty) {
      Mahasiswa mahasiswa = Mahasiswa(
        nama: _namaController.text,
        nim: _nimController.text,
        alamat: _alamatController.text,
        hobi: _hobiController.text,
      );
      await _dbHelper.insertMahasiswa(mahasiswa);
      _namaController.clear();
      _nimController.clear();
      _alamatController.clear();
      _hobiController.clear();
      _loadData(); // Refresh data
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua kolom harus diisi!')),
      );
    }
  }

  // Menghapus data mahasiswa
  _deleteMahasiswa(int id) async {
    await _dbHelper.deleteMahasiswa(id);
    _loadData(); // Refresh data setelah dihapus
  }

  // Menampilkan daftar mahasiswa
  _buildMahasiswaList() {
    return ListView.builder(
      itemCount: _mahasiswaList.length,
      itemBuilder: (context, index) {
        final mahasiswa = _mahasiswaList[index];
        return ListTile(
          title: Text(mahasiswa.nama),
          subtitle: Text('NIM: ${mahasiswa.nim}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteMahasiswa(mahasiswa.id!),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Mahasiswa'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _hobiController,
              decoration: InputDecoration(labelText: 'Hobi'),
            ),
          ),
          ElevatedButton(
            onPressed: _addMahasiswa,
            child: Text('Tambah Mahasiswa'),
          ),
          Expanded(
            child: _buildMahasiswaList(),
          ),
        ],
      ),
    );
  }
}