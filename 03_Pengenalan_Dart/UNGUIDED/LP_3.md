## Tugas Percabangan (Branching )

```dart
import 'dart:io';

String evaluasiNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Teks kosong jika tidak memenuhi kondisi
  }
}

void main() {
  // Minta input dari pengguna
  print('Masukkan nilai: ');
  int nilai = int.parse(stdin.readLineSync()!);

  // Evaluasi nilai dan tampilkan hasilnya
  String hasil = evaluasiNilai(nilai);
    print('$nilai merupakan $hasil');
}

```

### Penjelasan:

## 1. Import Paket
```dart
import 'dart:io';
```
Kode ini mengimpor paket `dart:io` untuk memungkinkan operasi input dan output, seperti membaca input dari pengguna melalui terminal.

## 2. Fungsi `evaluasiNilai`
Fungsi ini digunakan untuk mengevaluasi nilai berdasarkan beberapa kondisi.

```dart
String evaluasiNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Teks kosong jika tidak memenuhi kondisi
  }
}
```

- Parameter: `int nilai` - nilai yang akan dievaluasi.
- Fungsi ini mengevaluasi nilai dalam beberapa kondisi:
  - Jika nilai lebih besar dari 70, akan mengembalikan **"Nilai A"**.
  - Jika nilai lebih besar dari 40 dan kurang dari atau sama dengan 70, akan mengembalikan **"Nilai B"**.
  - Jika nilai lebih besar dari 0 dan kurang dari atau sama dengan 40, akan mengembalikan **"Nilai C"**.
  - Jika nilai tidak memenuhi syarat di atas, akan mengembalikan string kosong.

## 3. Fungsi `main()`
Fungsi utama ini adalah titik awal eksekusi program.

```dart
void main() {
  // Minta input dari pengguna
  print('Masukkan nilai: ');
  int nilai = int.parse(stdin.readLineSync()!);

  // Evaluasi nilai dan tampilkan hasilnya
  String hasil = evaluasiNilai(nilai);
  print('\$nilai merupakan \$hasil');
}
```

- Program akan meminta pengguna untuk memasukkan nilai melalui terminal dengan `print('Masukkan nilai: ')`.
- Input nilai akan dibaca menggunakan `stdin.readLineSync()` dan dikonversi menjadi tipe data `int` menggunakan `int.parse()`.
- Fungsi `evaluasiNilai()` kemudian dipanggil dengan nilai yang diberikan untuk menentukan kategori nilai.
- Hasil dari evaluasi akan ditampilkan kembali di terminal dengan format "\$nilai merupakan \$hasil".

## 4. Output
Contoh eksekusi program:
```
Masukkan nilai: 85
85 merupakan Nilai A
```

## 5. Penjelasan Tambahan
- **Kondisi If-Else:** Digunakan untuk membandingkan nilai yang diberikan dan mengembalikan hasil yang sesuai.
- **Penggunaan Paket `dart:io`:** Diperlukan untuk mengakses fungsi `stdin.readLineSync()` agar bisa membaca input dari terminal.

## Struktur Program

```dart
void main() {
  // Statement Control
  // if else
  var open = 8;
  var close = 17;
  var now = 13;

  if (now >= open && now <= close) {
    print("Open now!");
  } else if (now == 13) {
    print("istirahat sholat jumat");
  } else {
    print("Sorry, we're closed.");
  } // End if

  // condition ? true : false
  var toko = now > open ? 'Toko buka' : 'Toko tutup';
  print(toko);

  var nilai = 'b';

  // switch case
  switch (nilai) {
    case 'a':
      print('Nilai yang sangat bagus');
      break;
    case 'b':
      print('Nilai jelek');
      break;
    case 'c':
      print('Nilai sangat jelek');
      break;
    default:
      print('Nilai default');
  }
}
```

### Penjelasan:

1. **Penggunaan `if-else`:**
   - Program memeriksa waktu saat ini (`now`) untuk menentukan apakah toko sedang buka atau tutup. 
   - Jika kondisi `now >= open && now <= close` terpenuhi, akan mencetak `"Open now!"`.
   - Jika waktu saat ini adalah jam 13, program akan mencetak `"istirahat sholat jumat"`. 
   - Jika kedua kondisi tidak terpenuhi, akan mencetak `"Sorry, we're closed."`.

2. **Conditional Expression (Ternary Operator):**
   - Ekspresi kondisional digunakan untuk menentukan status toko dalam satu baris.
   - Baris `var toko = now > open ? 'Toko buka' : 'Toko tutup';` akan memeriksa apakah `now` lebih besar dari `open`. Jika ya, akan menghasilkan `'Toko buka'`, jika tidak, akan menghasilkan `'Toko tutup'`.

3. **Penggunaan `switch-case`:**
   - `switch` digunakan untuk memeriksa nilai variabel `nilai` dan mencetak pesan berdasarkan nilai tersebut.
   - Jika `nilai` adalah `'a'`, mencetak `'Nilai yang sangat bagus'`.
   - Jika `nilai` adalah `'b'`, mencetak `'Nilai jelek'`.
   - Jika `nilai` adalah `'c'`, mencetak `'Nilai sangat jelek'`.
   - `default` menangani kasus di mana nilai `nilai` tidak sesuai dengan kasus yang didefinisikan, dan akan mencetak `'Nilai default'`.

Program ini memperlihatkan penggunaan kontrol alur program dengan `if-else`, conditional expressions (ternary operator), dan `switch-case` dalam Dart.


 ### Output
![hasilStatement_Control](https://github.com/user-attachments/assets/844abef8-21b9-4f6d-9ed9-3672a3b57d32)

# C. Looping

# Penjelasan Program Dart dengan Perulangan (Looping)

Program ini mendemonstrasikan penggunaan dua jenis perulangan di Dart: `for` loop dan `while` loop.

## Struktur Program

```dart
void main() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  } // End for

  int i = 1;

  while (i <= 5) {
    print('Angka: \$i');
    i++;
  }
} // End main
```

### Penjelasan:

1. **Perulangan `for`:**
   - `for (int i = 1; i <= 10; i++)` adalah perulangan yang akan dieksekusi 10 kali, dari `i = 1` hingga `i = 10`.
   - Pada setiap iterasi, nilai `i` akan ditampilkan dengan menggunakan `print(i)`.
   - Ekspresi `i++` meningkatkan nilai `i` sebanyak 1 setelah setiap iterasi, sehingga loop akan berhenti ketika `i > 10`.

2. **Perulangan `while`:**
   - Perulangan `while` akan terus berjalan selama kondisi yang diberikan bernilai `true`.
   - Dalam hal ini, `while (i <= 5)` akan mencetak nilai `i` selama `i` masih kurang dari atau sama dengan 5.
   - Setelah setiap iterasi, nilai `i` akan ditambah 1 (`i++`) untuk memastikan loop tidak berjalan tanpa henti.
   
   Perulangan berhenti saat nilai `i` melebihi 5.

Program ini menunjukkan bagaimana melakukan perulangan di Dart menggunakan dua mekanisme perulangan yang berbeda: `for` dan `while` loop.

 ### Output
 ![hasilloop](https://github.com/user-attachments/assets/fbd21cfc-89c2-49e9-a53c-51996c2be287)

# D. List
## Penjelasan Kode

### List dengan Panjang Tetap:
```dart
List<int> fixedList = List.filled(3, 0);
```
- Baris ini membuat list dengan panjang tetap, yaitu 3 elemen, dan setiap elemen diinisialisasi dengan nilai `0`.

Elemen-elemen kemudian diperbarui dengan nilai tertentu:
```dart
fixedList[0] = 10;
fixedList[1] = 20;
fixedList[2] = 30;
```
- Elemen pada indeks 0, 1, dan 2 diisi dengan nilai 10, 20, dan 30.

Setelah elemen-elemen tersebut diubah, berikut hasilnya:
```dart
print('Fixed Length List: \$fixedList');
```
Hasil keluaran:
```
Fixed Length List: [10, 20, 30]
```

### List yang Dapat Bertambah Panjang:
```dart
List<int> growableList = [];
```
- List ini dideklarasikan sebagai list kosong, dan ukurannya bisa bertambah sesuai kebutuhan.

Kita dapat menambahkan elemen menggunakan metode `add()`:
```dart
growableList.add(10);
growableList.add(20);
growableList.add(30);
```
Setelah elemen-elemen tersebut ditambahkan, hasilnya:
```
Growable List setelah menambah elemen: [10, 20, 30]
```

### Menambah Elemen Lagi:
```dart
growableList.add(40);
growableList.add(50);
```
List sekarang berisi:
```
[10, 20, 30, 40, 50]
```

### Menghapus Elemen:
```dart
growableList.remove(20);
```
Kode ini menghapus nilai `20` dari list, dan list menjadi seperti ini:
```
Growable List setelah menghapus elemen: [10, 30, 40, 50]
```


 ### Output
 ![hasillist](https://github.com/user-attachments/assets/b06fdd45-9316-4912-9ce5-2252050c1585)

 # E. Fungsi
 
# Penjelasan Kode

Kode ini merupakan contoh dasar dalam bahasa pemrograman Dart yang menunjukkan cara membuat fungsi sederhana untuk mencetak pesan dan melakukan perkalian, serta memanggilnya di dalam fungsi utama (`main`).

## Fungsi 1: cetakPesan
```dart
void cetakPesan(String pesan) {
  print(pesan); 
}
```
Fungsi ini bertipe `void` (tidak mengembalikan nilai) dan menerima satu parameter bertipe `String` bernama `pesan`. Fungsi ini akan mencetak nilai dari parameter tersebut menggunakan fungsi `print`.

## Fungsi 2: perkalian
```dart
int perkalian(int a, int b) {
  return a * b;
}
```
Fungsi `perkalian` ini menerima dua parameter bertipe `int` (bilangan bulat) dan mengembalikan hasil perkalian dari kedua parameter tersebut. Nilai hasil perkalian dikembalikan melalui perintah `return`.

## Fungsi 3: main
```dart
void main() {
  int hasil = perkalian(5, 10);
  print("Hasil perkalian: $hasil");

  cetakPesan("Hello World");
}
```
Fungsi `main` adalah titik masuk program. Dalam fungsi ini, pertama-tama kita memanggil fungsi `perkalian` dengan nilai `5` dan `10`, menyimpan hasilnya ke dalam variabel `hasil`, dan mencetak hasilnya dengan `print`. Setelah itu, fungsi `cetakPesan` dipanggil untuk mencetak pesan "Hello World".


  ### Output
  ![hasilfungsi](https://github.com/user-attachments/assets/d4ef1d2f-9099-412a-8665-352c182ddeff)
