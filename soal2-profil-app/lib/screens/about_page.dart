import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Section 1: Keahlian & Hobi (min. 3 item)
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
              child: Text(
                'Keahlian & Hobi',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.flutter_dash, color: Colors.blue),
                    title: Text('Flutter & Dart Development'),
                    subtitle: Text(
                        'Membangun aplikasi mobile cross-platform Android & iOS'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.security, color: Colors.red),
                    title: Text('Application Security & Reverse Engineering'),
                    subtitle: Text(
                        'Audit keamanan kode, binary analysis, dan mobile pentesting'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.design_services, color: Colors.purple),
                    title: Text('UI/UX Design & Prototyping'),
                    subtitle: Text(
                        'Mendesain antarmuka aplikasi modern dengan Material 3'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.sports_esports, color: Colors.green),
                    title: Text('E-Sports & Gaming Strategy'),
                    subtitle:
                        Text('Mengasah fokus, refleks, dan kerja sama tim'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Section 2: Riwayat Pendidikan
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
              child: Text(
                'Riwayat Pendidikan',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.school, color: Colors.indigo),
                    title: Text('S1 Teknik Informatika'),
                    subtitle: Text(
                        'Institut Teknologi & Bisnis Bina Sarana Global (2022 - Sekarang)'),
                    trailing: Text('IPK: 3.85',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading:
                        Icon(Icons.account_balance, color: Colors.teal),
                    title: Text('SMK / SMA Negeri'),
                    subtitle: Text('Jurusan Rekayasa Perangkat Lunak / IPA'),
                    trailing: Text('Lulus 2022'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Section 3: Informasi Tambahan
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.verified,
                        color: theme.colorScheme.onPrimaryContainer, size: 36),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Aplikasi ini dibuat untuk memenuhi Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile Lanjutan (PML).',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

