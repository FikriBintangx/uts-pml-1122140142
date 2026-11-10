import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Fikri Bintang',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Fikri Bintang Purnomo',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                'NIM: 1122140142',
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Teknik Informatika',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Card Kontak (min. 4 InfoTile)
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'fikrbintang01@gmail.com',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '0812-3456-7890',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Kelas',
                        value: 'PML - Teknik Informatika',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/FikriBintangx',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Card Keahlian / Hobi (min. 3 InfoTile)
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.flutter_dash,
                        label: 'Keahlian 1',
                        value: 'Flutter & Dart Mobile Development',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.security,
                        label: 'Keahlian 2',
                        value: 'Application Security & Reverse Engineering',
                      ),
                      Divider(height: 1),
                      InfoTile(
                        icon: Icons.palette,
                        label: 'Hobi',
                        value: 'UI/UX Design & Coding Projects',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}
