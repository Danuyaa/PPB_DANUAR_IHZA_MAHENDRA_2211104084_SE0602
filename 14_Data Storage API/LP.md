<div align="center">

**TUGAS PENDAHULUAN** <br>
**PEMOGRAMAN PERANGKAT BERGERAK** <br>
**MODUL XII** <br>

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
REST API (Representational State Transfer Application Programming Interface) adalah antarmuka
yang memungkinkan aplikasi klien untuk berinteraksi dengan database melalui protokol HTTP. REST
API menyediakan cara untuk membaca, menambahkan, memperbarui, dan menghapus data dari
database tanpa harus mengakses database langsung.Mendapatkan token unik dari setiap perangkat
pengguna.

---

### main.dart
```dart
import 'package:flutter/material.dart';
import 'package:guided/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
```

### screens/home_page.dart
```dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _posts = [];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _handleApiOperation(
      Future<void> operation, String successMessage) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await operation;
      setState(() {
        _posts = _apiService.posts;
      });
      _showSnackBar(successMessage);
    } catch (e) {
      _showSnackBar('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API - Praktikum 14'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isLoading)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Mengambil data...'),
                  ],
                ),
              )
            else if (_posts.isEmpty)
              const Text(
                "Tekan tombol GET untuk mengambil data",
                style: TextStyle(fontSize: 12),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          leading:
                              const Icon(Icons.article, color: Colors.blue),
                          title: Text(
                            _posts[index]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            _posts[index]['body'],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 20),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.fetchPosts(), 'Data berhasil diambil!'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.createPost(), 'Data berhasil ditambahkan!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    iconColor: Colors.white,
                  ),
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.updatePost(), 'Data berhasil diperbarui!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    iconColor: Colors.white,
                  ),
                  child: const Text('UPDATE'),
                ),
                ElevatedButton(
                  onPressed: () => _handleApiOperation(
                      _apiService.deletePost(), 'Data berhasil dihapus!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    iconColor: Colors.white,
                  ),
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### services/api_services.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  List<dynamic> posts = []; // Menyimpan data post yang diterima
  // Fungsi untuk GET data
  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      posts = json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Fungsi untuk POST data
  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'userId': 1,
      }),
    );
    if (response.statusCode == 201) {
      posts.add({
        'title': 'Flutter Post',
        'body': 'Ini contoh POST.',
        'id': posts.length + 1,
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

  // Fungsi untuk UPDATE data
  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/1'),
      body: json.encode({
        'title': 'Updated Title',
        'body': 'Updated Body',
        'userId': 1,
      }),
    );
    if (response.statusCode == 200) {
      final updatedPost = posts.firstWhere((post) => post['id'] == 1);
      updatedPost['title'] = 'Updated Title';
      updatedPost['body'] = 'Updated Body';
    } else {
      throw Exception('Failed to update post');
    }
  }

  // Fungsi untuk DELETE data
  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('$baseUrl/posts/1'),
    );
    if (response.statusCode == 200) {
      posts.removeWhere((post) => post['id'] == 1);
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
```

## Output
### GET
![image](https://github.com/user-attachments/assets/0abd4760-f865-4b1e-8777-e623a43b6872)
### POST
![image](https://github.com/user-attachments/assets/118e4025-7150-40cc-b43c-e83351f645fd)
### UPDATE
![image](https://github.com/user-attachments/assets/90ed2813-76fa-4c21-8ebe-9915354bc3b3)
### DELETE
![image](https://github.com/user-attachments/assets/bb8a5f55-f8ee-4097-83a7-752d1d6a202e)

---

# UNGUIDED

a. Gunakan State Management dengan GetX:
- Atur data menggunakan state management GetX agar lebih mudah dikelola.
- Implementasi GetX meliputi pembuatan controller untuk mengelola data dan penggunaan widget Obx untuk menampilkan data secara otomatis setiap kali ada perubahan.

b. Tambahkan Snackbar untuk Memberikan Respon Berhasil:
- Tampilkan snackbar setelah setiap operasi berhasil, seperti menambah atau memperbarui data.
- Gunakan Get.snackbar agar pesan sukses muncul di layar dan mudah dipahami oleh pengguna.

---

### main.dart
```dart
import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
```
### models/post_model.dart
```dart
class Post {
  int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
```
### services/api_service.dart
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(int id, Post post) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
```
### controllers/post_controller.dart
```dart
import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = false.obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var fetchedPosts = await apiService.fetchPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch posts');
    } finally {
      isLoading(false);
    }
  }

  void addPost(Post post) async {
    try {
      var newPost = await apiService.createPost(post);
      posts.add(newPost);
      Get.snackbar('Success', 'Post created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create post');
    }
  }

  void updatePost(int id, Post post) async {
    try {
      var updatedPost = await apiService.updatePost(id, post);
      int index = posts.indexWhere((p) => p.id == id);
      if (index != -1) {
        posts[index] = updatedPost;
        Get.snackbar('Success', 'Post updated successfully');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update post');
    }
  }

  void deletePost(int id) async {
    try {
      await apiService.deletePost(id);
      posts.removeWhere((post) => post.id == id);
      Get.snackbar('Success', 'Post deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete post');
    }
  }
}
```
### views/home_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';
import '../models/post_model.dart';

class HomeScreen extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNGUIDED'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: postController.posts.length,
            itemBuilder: (context, index) {
              var post = postController.posts[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          post.body,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showPostDialog(post, isEdit: true);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              postController.deletePost(post.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPostDialog(Post(id: 0, title: '', body: ''), isEdit: false);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _showPostDialog(Post post, {required bool isEdit}) {
    final titleController = TextEditingController(text: post.title);
    final bodyController = TextEditingController(text: post.body);

    Get.defaultDialog(
      title: isEdit ? 'Edit Post' : 'Create Post',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
            maxLines: 3,
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          if (isEdit) {
            postController.updatePost(
              post.id,
              Post(
                id: post.id,
                title: titleController.text,
                body: bodyController.text,
              ),
            );
          } else {
            postController.addPost(
              Post(
                id: DateTime.now().millisecondsSinceEpoch,
                title: titleController.text,
                body: bodyController.text,
              ),
            );
          }
          Get.back();
        },
        child: Text(isEdit ? 'Update' : 'Create'),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }
}
```

## Output
### GET
![image](https://github.com/user-attachments/assets/4d760ff8-f0bf-4392-a88b-5d6e34e4b272)
### DELETE
![image](https://github.com/user-attachments/assets/070144da-007a-44f9-b4df-412df427f1cc)
### UPDATE
![image](https://github.com/user-attachments/assets/f85b952d-e5b8-42c9-989b-201e860fe519)
### POST
![image](https://github.com/user-attachments/assets/fe636a4b-221f-42bd-8f9f-f94ee4da1e78)

# Deskripsi Program

Program ini adalah aplikasi Flutter yang menggunakan GetX sebagai state management untuk mengelola operasi CRUD (Create, Read, Update, Delete) melalui API. Aplikasi ini berinteraksi dengan API publik `https://jsonplaceholder.typicode.com/` untuk mengambil, menambah, memperbarui, dan menghapus data post.

### Fitur Utama:
1. **Fetch Data (GET):**
   - Program mengambil daftar post dari API dan menampilkannya dalam bentuk grid yang lebih modern dan responsif.
   - Data yang diambil akan disimpan dalam state menggunakan GetX dan diperbarui secara otomatis ketika ada perubahan.

2. **Tambah Data (POST):**
   - Pengguna dapat membuat post baru dengan menekan tombol tambah (+) yang memunculkan dialog input.
   - Setelah post berhasil dibuat, data baru ditambahkan ke daftar tanpa perlu refresh halaman.

3. **Perbarui Data (PUT):**
   - Setiap post memiliki tombol edit. Saat ditekan, dialog input muncul dengan data yang sudah ada untuk diperbarui.
   - Setelah diperbarui, daftar post langsung di-refresh secara otomatis.

4. **Hapus Data (DELETE):**
   - Tombol delete tersedia di setiap post untuk menghapus data.
   - Notifikasi snackbar muncul dengan pesan 'Deleted successfully' setelah post berhasil dihapus.

### Teknologi yang Digunakan:
- **Flutter**: Framework utama untuk pengembangan aplikasi.
- **GetX**: Digunakan untuk state management, snackbar, dialog, dan navigasi.
- **HTTP**: Digunakan untuk melakukan permintaan API.

### Alur Kerja:
1. Saat aplikasi dijalankan, fungsi `fetchPosts` dipanggil untuk mengambil data post dari API.
2. Data post disimpan dalam variabel `posts` yang diobservasi menggunakan `.obs` dari GetX.
3. Setiap perubahan pada `posts` langsung memicu pembaruan tampilan secara otomatis (Reactive UI).
4. Pengguna dapat menambahkan post baru melalui tombol tambah dan memperbarui/menghapus post dari daftar.

Aplikasi ini menunjukkan cara sederhana namun efektif untuk mengimplementasikan operasi CRUD menggunakan Flutter dan GetX dengan antarmuka yang ramah pengguna dan responsif.

---
