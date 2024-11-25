import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Biodata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 24, 75, 151)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Biodata Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Image
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Ganti dengan URL gambar profil Anda
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                'Danuar Ihza Mahendra',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 8),

              // Personal Info
              Card(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Biodata:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Name'),
                        subtitle: Text('Danuar Ihza Mahendara'),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text('Tanggal lahir'),
                        subtitle: Text('01-01-2004'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email'),
                        subtitle: Text('danuar@gmail.com'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text('Address'),
                        subtitle: Text('Jl. DI Panjaitan No.128, Karangreja, Purwokerto Kidul, Kec. Purwokerto Sel., Kabupaten Banyumas, Jawa Tengah 53147'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('kontak'),
                        subtitle: Text('+62 817-7902-5329'),
                      ),
                    ],
                  ),
                ),
              ),

              // Social Media Buttons
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    color: Colors.lightBlue,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.facebook),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
