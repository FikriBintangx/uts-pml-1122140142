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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
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
                children: [
                  ListTile(
                    leading: Icon(Icons.phone_android, color: theme.colorScheme.primary),
                    title: const Text('Mata Kuliah: Aplikasi Mobile'),
                    subtitle: const Text(
                        'Aplikasi Mobile (Flutter & Dart Cross-Platform)'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.security, color: theme.colorScheme.primary),
                    title: const Text('Keahlian: Security & Reverse Engineering'),
                    subtitle: const Text(
                        'Audit keamanan kode, binary analysis, dan mobile pentesting'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.design_services, color: theme.colorScheme.primary),
                    title: const Text('UI/UX Design & Prototyping'),
                    subtitle: const Text(
                        'Mendesain antarmuka aplikasi modern dengan Material 3'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.sports_esports, color: theme.colorScheme.primary),
                    title: const Text('E-Sports & Gaming Strategy'),
                    subtitle:
                        const Text('Mengasah fokus, refleks, dan kerja sama tim'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
                children: [
                  ListTile(
                    leading: Icon(Icons.school, color: theme.colorScheme.primary),
                    title: const Text('Semester 5 - Teknik Informatika'),
                    subtitle: const Text(
                        'Institut Teknologi & Bisnis Bina Sarana Global (2022 - Sekarang)'),
                    trailing: const Text('IPK: 3.85',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading:
                        Icon(Icons.account_balance, color: theme.colorScheme.primary),
                    title: const Text('SMK - Teknik Komputer & Jaringan (TKJ)'),
                    subtitle: const Text('Jurusan TKJ (Teknik Komputer dan Jaringan)'),
                    trailing: const Text('Lulus 2022'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
                        'Aplikasi ini dibuat untuk memenuhi Ujian Tengah Semester (UTS) mata kuliah Aplikasi Mobile.',
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

