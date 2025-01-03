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

# TUGAS PENDAHULUAN

### 1. Jelaskan secara singkat fungsi SQLite dalam pengembangan aplikasi mobile!
SQLite adalah sebuah sistem manajemen database ringan yang sering digunakan dalam pengembangan aplikasi mobile untuk menyimpan data lokal secara efisien tanpa memerlukan server eksternal.

### 2. Apa saja yang dimaksud dengan operasi CRUD? Berikan penjelasan singkat untuk masing-masing operasi!
CRUD adalah akronim dari Create, Read, Update, dan Delete, yang merupakan operasi dasar dalam pengelolaan database:
- **Create**: Menambahkan data baru ke dalam tabel.
- **Read**: Membaca atau mengambil data dari tabel.
- **Update**: Memperbarui data yang sudah ada di tabel.
- **Delete**: Menghapus data dari tabel.

### 3. Tuliskan kode SQL untuk membuat tabel bernama `users` dengan kolom berikut:
- **id** (integer, primary key, auto increment)
- **name** (text)
- **email** (text)
- **createdAt** (timestamp, default value adalah waktu sekarang)

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 4. Sebutkan langkah-langkah utama untuk menggunakan plugin sqflite di dalam Flutter!
1. Tambahkan dependensi `sqflite` dan `path` pada file `pubspec.yaml`.
2. Import library `sqflite` dan `path` di file Dart.
3. Buat fungsi untuk membuka atau membuat database menggunakan `openDatabase`.
4. Buat tabel atau inisialisasi database jika belum ada.
5. Lakukan operasi CRUD menggunakan metode-metode seperti `insert`, `query`, `update`, dan `delete`.

### 5. Lengkapi kode berikut untuk membaca semua data dari tabel `users` menggunakan sqflite.

```dart
static Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await SQLHelper.db();
  return db.query('users');
}
```

