## 1. Tugas Percabangan (Branching )

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

## Output
![Screenshot 2024-10-02 211805](https://github.com/user-attachments/assets/847a17ed-74eb-453a-943c-4e3f9329338c)

##
## 2.Tugas Looping (Perulangan)

```dart
void main() {
  // Minta input dari pengguna
  print('Masukkan tinggi piramida: ');
  int tinggi = int.parse(stdin.readLineSync()!);

  // Menggambar piramida
  for (int i = 1; i <= tinggi; i++) {
    // Mencetak spasi untuk memusatkan piramida
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(' ');
    }
    // Mencetak bintang
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }
    // Pindah ke baris berikutnya
    print('');
  }
}
```

### Penjelasan:

## 1. Fungsi `main()`
Fungsi utama yang mengeksekusi program.

```dart
void main() {
  // Minta input dari pengguna
  print('Masukkan tinggi piramida: ');
  int tinggi = int.parse(stdin.readLineSync()!);
```
- Program meminta pengguna untuk memasukkan tinggi piramida. Input ini diambil menggunakan `stdin.readLineSync()` dan dikonversi menjadi tipe `int` menggunakan `int.parse()`.
- **Tinggi piramida** yang dimasukkan menentukan jumlah baris bintang yang akan ditampilkan.

## 2. Menggambar Piramida
```dart
  // Menggambar piramida
  for (int i = 1; i <= tinggi; i++) {
    // Mencetak spasi untuk memusatkan piramida
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(' ');
    }
    // Mencetak bintang
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }
    // Pindah ke baris berikutnya
    print('');
  }
}
```

### a. Loop Pertama (Baris Piramida)
- `for (int i = 1; i <= tinggi; i++)`: Loop ini digunakan untuk mengatur jumlah baris piramida sesuai dengan tinggi yang diberikan.
  - `i` mewakili nomor baris saat ini.

### b. Loop Kedua (Spasi)
- `for (int j = 1; j <= tinggi - i; j++)`: Loop ini mencetak spasi untuk memusatkan piramida. Semakin ke bawah, semakin sedikit spasi yang dicetak karena piramida melebar.
  - Jumlah spasi yang dicetak adalah `tinggi - i`.

### c. Loop Ketiga (Bintang)
- `for (int k = 1; k <= (2 * i - 1); k++)`: Loop ini mencetak bintang pada setiap baris. Jumlah bintang yang dicetak adalah `(2 * i - 1)`, sehingga pada baris pertama hanya 1 bintang, baris kedua 3 bintang, dan seterusnya.
  - Pola bintang mengikuti urutan ganjil (1, 3, 5, 7, dst.).

### d. Pindah Baris
- Setelah mencetak bintang pada satu baris, program pindah ke baris berikutnya dengan `print('')`.

## Output
![Screenshot 2024-10-02 211902](https://github.com/user-attachments/assets/2707e418-55f3-45f4-a4f0-36e9903897af)

##
## 3.Tugas Function

# Penjelasan Kode Dart - Mengecek Bilangan Prima

Kode ini ditulis dalam bahasa pemrograman **Dart** dan digunakan untuk mengecek apakah suatu bilangan merupakan bilangan prima atau bukan.

## Penjelasan Fungsi

### 1. Fungsi `isPrima(int number)`
Fungsi ini bertugas untuk mengecek apakah sebuah bilangan adalah bilangan prima. 

#### Alur Fungsi:
- **Baris 3:** Bilangan kurang dari 2 secara langsung dianggap bukan bilangan prima karena bilangan prima adalah bilangan bulat lebih besar dari 1.
- **Baris 7-11:** Fungsi melakukan perulangan mulai dari angka 2 hingga akar kuadrat dari `number` untuk mengecek apakah bilangan tersebut habis dibagi oleh bilangan lain (tidak ada sisa). 
  - Jika `number` habis dibagi oleh angka mana pun dalam rentang ini, maka `number` bukan bilangan prima dan fungsi akan mengembalikan `false`.
  - Jika tidak ditemukan pembagi selain 1 dan `number` itu sendiri, maka fungsi mengembalikan `true`, artinya bilangan tersebut adalah bilangan prima.

### 2. Fungsi `main()`
Fungsi utama ini adalah titik awal dari program.

#### Alur Fungsi:
- **Baris 14:** Program akan meminta pengguna untuk memasukkan sebuah bilangan bulat.
- **Baris 15:** Input dari pengguna diambil menggunakan `stdin.readLineSync()` dan diubah menjadi tipe data `int`.
- **Baris 18:** Program akan memanggil fungsi `isPrima` untuk mengecek apakah bilangan yang diinput adalah bilangan prima.
- **Baris 19-22:** Berdasarkan hasil dari fungsi `isPrima`, program akan mencetak apakah bilangan tersebut adalah bilangan prima atau bukan.

## Output:
![Screenshot 2024-10-02 213403](https://github.com/user-attachments/assets/e7ceddc9-b5ff-4421-a7ce-d8a9aebcd32f)
