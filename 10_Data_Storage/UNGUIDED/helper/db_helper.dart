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