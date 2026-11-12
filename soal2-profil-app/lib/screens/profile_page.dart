import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ProfilePage({super.key, required this.themeNotifier});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile.initialData();

  Future<void> _navigateToEditProfile() async {
    final result = await Navigator.pushNamed(
      context,
      '/edit',
      arguments: profile,
    );

    if (result != null && result is Profile) {
      setState(() {
        profile = result;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profil berhasil diperbarui!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = widget.themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Ganti Mode Gelap/Terang',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              widget.themeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          IconButton(
            tooltip: 'Edit Profil',
            icon: const Icon(Icons.edit),
            onPressed: _navigateToEditProfile,
          ),
        ],
      ),
      // Komponen Scaffold Tambahan 1: Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(profile.imageAsset),
              ),
              accountName: Text(
                profile.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(profile.email),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya & Riwayat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _navigateToEditProfile();
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              title: Text(isDark ? 'Mode Terang' : 'Mode Gelap'),
              trailing: Switch(
                value: isDark,
                onChanged: (val) {
                  widget.themeNotifier.value =
                      val ? ThemeMode.dark : ThemeMode.light;
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar / Logout',
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              // Foto diri dari folder assets/images/
              CircleAvatar(
                radius: 56,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(profile.imageAsset),
                ),
              ),
              const SizedBox(height: 16),
              // Nama Lengkap
              Text(
                profile.nama,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              // NIM & Prodi
              Text(
                '${profile.nim} • ${profile.prodi}',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              // Kelas
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  profile.kelas,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Bio Singkat Card
              Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.format_quote, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          profile.bio,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Kontak Card
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    InfoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: profile.email,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.phone,
                      label: 'Nomor HP',
                      value: profile.nomorHp,
                    ),
                    const Divider(height: 1),
                    InfoTile(
                      icon: Icons.code,
                      label: 'Akun GitHub',
                      value: profile.github,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Card Navigasi Cepat ke About Page
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.info, color: Colors.indigo),
                  title: const Text('Keahlian & Riwayat Pendidikan'),
                  subtitle: const Text('Lihat informasi lengkap tentang saya'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // Komponen Scaffold Tambahan 2: FloatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToEditProfile,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }
}

