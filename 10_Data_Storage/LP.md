<div align="center">

**TUGAS PENDAHULUAN** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL X** <br>

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
## A.Pengenalan SQLite
SQLite adalah database relasional yang merupakan penyimpanan data secara
offline untuk sebuah mobile app (pada local storage, lebih tepatnya pada cache
memory aplikasi). SQLite memiliki CRUD (create, read, update dan delete).
Empat operasi tersebut penting dalam sebuah penyimpanan. Untuk struktur
database pada SQLite, sama seperti SQL pada umumnya, variabel dan tipe
data yang dimiliki tidak jauh berbeda dengan SQL. Untuk informasi terkait basic
SQL ada pada link berikut.
## B. SQL Helper Dasar
Dalam Flutter, SQL Helper biasanya merujuk pada penggunaan paket seperti
sqflite untuk mengelola database SQLite. SQL Helper merupakan class untuk
membuat beberapa method yang berkaitan dengan perubahan data. sqflite
adalah plugin Flutter yang memungkinkan untuk melakukan operasi CRUD
(Create, Read, Update, Delete) pada database SQLite.
---
Tambahkan plugin sqflite dan path ke file pubspec.yaml.

- helper/db_helper.dart
```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    // Jika database sudah ada, kembalikan instansinya
    if (_database != null) return _database!;
    // Jika belum, inisialisasi database
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Mendapatkan path untuk database
    String path = join(await getDatabasesPath(), 'my_database.db');
    // Membuka database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Membuat tabel saat database diinisialisasi
    await db.execute('''
      CREATE TABLE my_table(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
        title TEXT, 
        description TEXT, 
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    ''');
  }

  // Metode untuk memasukkan data ke tabel
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('my_table', row);
  }

  // Metode untuk mengambil semua data dari tabel
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('my_table');
  }

  // Metode untuk memperbarui data
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('my_table', row, where: 'id = ?', whereArgs: [id]);
  }

  // Metode untuk menghapus data
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('my_table', where: 'id = ?', whereArgs: [id]);
  }
}
```
- view/my_db_view.dart
```dart
import 'package:flutter/material.dart';
import 'package:modul_10/helper/db_helper.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  State<MyDatabaseView> createState() => _MyDatabaseViewState();
}

class _MyDatabaseViewState extends State<MyDatabaseView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _dbData = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // Metode untuk memperbarui data dari database
  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _dbData = data;
    });
  }

  // Metode untuk menambahkan data ke database
  void _addData() async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      await dbHelper.insert({
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      _titleController.clear();
      _descriptionController.clear();
      _refreshData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fields cannot be empty!')),
      );
    }
  }

  // Metode untuk memperbarui data dalam database
  void _updateData(int id) async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      await dbHelper.update({
        'id': id,
        'title': _titleController.text,
        'description': _descriptionController.text,
      });
      _titleController.clear();
      _descriptionController.clear();
      _refreshData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fields cannot be empty!')),
      );
    }
  }

  // Metode untuk menghapus data dari database
  void _deleteData(int id) async {
    await dbHelper.delete(id);
    _refreshData();
  }

  // Menampilkan dialog untuk mengedit data
  void _showEditDialog(Map<String, dynamic> item) {
    _titleController.text = item['title'];
    _descriptionController.text = item['description'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateData(item['id']);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Database - sqflite'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ),
          ElevatedButton(
            onPressed: _addData,
            child: const Text('Add Data'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dbData.length,
              itemBuilder: (context, index) {
                final item = _dbData[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showEditDialog(item);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteData(item['id']);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:modul_10/view/my_db_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyDatabaseView(), // Mengganti halaman utama ke MyDatabase
    );
  }
}

```

---

**Output**

![image](https://github.com/user-attachments/assets/8f77042a-c6ab-45e1-93c0-3917ee305e99)


---
# UNGUIDED

## A. Tugas Mandiri
Soal: Buatlah sebuah project aplikasi Flutter dengan SQLite untuk menyimpan data
biodata mahasiswa yang terdiri dari nama, NIM, domisili, dan hobi. Data yang dimasukkan
melalui form akan ditampilkan dalam daftar di halaman utama.


**Input**

- helper/db_helper.dart
```dart
import 'package:modul_10/models/mahasiswa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mahasiswa.db');
    return _database!;
  }

  // Inisialisasi database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Membuat tabel mahasiswa
  Future _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE mahasiswa ( 
      id $idType, 
      nama $textType,
      nim $textType,
      alamat $textType,
      hobi $textType
    )
    ''');
  }

  // Menyimpan mahasiswa ke database
  Future<int> insertMahasiswa(Mahasiswa mahasiswa) async {
    final db = await instance.database;
    return await db.insert('mahasiswa', mahasiswa.toMap());
  }

  // Mengambil semua data mahasiswa
  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final db = await instance.database;
    final result = await db.query('mahasiswa');
    return result.map((json) => Mahasiswa.fromMap(json)).toList();
  }

  // Menghapus mahasiswa berdasarkan ID
  Future<int> deleteMahasiswa(int id) async {
    final db = await instance.database;
    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
```
- models/mahasiswa.dart
```dart
class Mahasiswa {
  int? id;
  String nama;
  String nim;
  String alamat;
  String hobi;

  Mahasiswa({
    this.id,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.hobi,
  });

  // Mengubah objek Mahasiswa menjadi Map (untuk disimpan ke database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }

  // Mengubah Map menjadi objek Mahasiswa
  static Mahasiswa fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      alamat: map['alamat'],
      hobi: map['hobi'],
    );
  }
}


```
- pages/pages.dart
```dart
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

```
- main.dart
```dart
import 'package:flutter/material.dart';
import 'package:modul_10/pages/pages.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

```

---

**Output**

![image](https://github.com/user-attachments/assets/bc9221b3-7fb4-448e-aa3a-8d0356cefb1e)


---
