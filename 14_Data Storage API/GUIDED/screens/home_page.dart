import 'package:flutter/material.dart';
import '../services/api_services.dart';

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