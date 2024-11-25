<div align="center">

**TUGAS PENDAHULUAN** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL XI** <br>

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


## 1. Firebase dan Fitur Utamanya

### a. Pengertian Firebase
Firebase adalah platform pengembangan aplikasi berbasis cloud yang dimiliki oleh Google. Platform ini menyediakan berbagai layanan untuk membantu pengembang membangun, mengelola, dan meningkatkan aplikasi secara efisien. Firebase mendukung pengembangan backend tanpa server (serverless), integrasi real-time, analitik, dan banyak fitur lainnya yang dirancang untuk aplikasi mobile maupun web.

### b. Tiga Fitur Utama Firebase Beserta Fungsinya
1. **Realtime Database**
   - **Fungsi:** Realtime Database adalah database NoSQL berbasis cloud yang memungkinkan aplikasi menyimpan dan menyinkronkan data antar klien dalam waktu nyata. Sangat cocok untuk aplikasi yang membutuhkan pembaruan data secara langsung, seperti aplikasi obrolan.
   
2. **Firebase Authentication**
   - **Fungsi:** Layanan ini menyediakan berbagai metode autentikasi pengguna, termasuk login dengan email/password, nomor telepon, serta login menggunakan layanan pihak ketiga seperti Google, Facebook, atau Apple. Tujuannya adalah untuk mempermudah pengelolaan identitas pengguna.

3. **Cloud Firestore**
   - **Fungsi:** Cloud Firestore adalah database NoSQL yang fleksibel dan skalabel, yang memungkinkan pengembang menyimpan data secara terstruktur dengan kemampuan kueri lebih canggih dibanding Realtime Database. Cocok untuk aplikasi dengan kebutuhan data kompleks.

---

## 2. Notification Message vs. Data Message

### Perbedaan Utama
- **Notification Message**  
  Pesan yang berisi konten notifikasi dan ditujukan langsung untuk ditampilkan kepada pengguna melalui tray notifikasi perangkat. Firebase secara otomatis menangani tampilan pesan ini.  
  **Contoh Penggunaan:** Mengirim notifikasi "Flash Sale 50% untuk 1 jam!" kepada semua pengguna aplikasi e-commerce.

- **Data Message**  
  Pesan khusus yang berisi data mentah (key-value pairs) yang tidak langsung ditampilkan. Pengembang memiliki kendali penuh untuk menangani dan memproses pesan ini dalam aplikasi.  
  **Contoh Penggunaan:** Mengirim data tambahan tentang pembaruan aplikasi kepada klien untuk diproses tanpa menampilkan notifikasi.

### Perbedaan Teknis
| Aspek                   | Notification Message        | Data Message            |
|-------------------------|----------------------------|-------------------------|
| **Ditampilkan otomatis** | Ya                        | Tidak                  |
| **Handler di client**    | Ditangani oleh FCM         | Ditangani oleh pengembang |
| **Cakupan penggunaan**   | Untuk notifikasi visual    | Untuk data operasional |

---

## 3. FCM Token

### Pengertian FCM Token
Firebase Cloud Messaging (FCM) Token adalah identitas unik berbasis perangkat yang dihasilkan oleh Firebase untuk mengidentifikasi perangkat tertentu yang terhubung ke aplikasi. Token ini digunakan untuk mengarahkan pesan notifikasi atau data ke perangkat yang sesuai.

### Pentingnya FCM Token
- Token ini memastikan bahwa pesan hanya dikirimkan ke perangkat yang relevan.
- Mendukung komunikasi personalisasi, misalnya mengirim pesan hanya ke perangkat pengguna tertentu.
- Token bersifat dinamis, sehingga dapat diperbarui jika perangkat menginstal ulang aplikasi atau jika ada perubahan pada token sebelumnya.

---

## 4. Penanganan Notifikasi oleh FCM

### a. Saat Aplikasi Berada di Foreground
- **Penanganan:**  
  Jika aplikasi sedang berjalan di latar depan, pesan *Notification Message* tidak secara otomatis ditampilkan di tray notifikasi. Sebaliknya, pengembang harus menulis logika untuk menangani pesan ini, seperti menampilkan dialog atau mengupdate antarmuka pengguna.

### b. Saat Aplikasi Berada di Background
- **Penanganan:**  
  Untuk *Notification Message*, Firebase otomatis menampilkan notifikasi di tray perangkat tanpa melibatkan pengembang. Namun, untuk *Data Message*, aplikasi akan menerima pesan di *onMessageReceived* hanya jika ada pengaturan khusus.

### c. Saat Aplikasi dalam Kondisi Terminated
- **Penanganan:**  
  Jika aplikasi tidak berjalan sama sekali:
  - *Notification Message* tetap ditampilkan otomatis di tray perangkat.
  - *Data Message* tidak dapat diproses kecuali ada konfigurasi untuk memicu aktivitas tertentu saat pesan diterima.

