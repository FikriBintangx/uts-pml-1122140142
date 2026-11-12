import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;
  late TextEditingController _githubController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profile.nama);
    _nimController = TextEditingController(text: widget.profile.nim);
    _prodiController = TextEditingController(text: widget.profile.prodi);
    _kelasController = TextEditingController(text: widget.profile.kelas);
    _emailController = TextEditingController(text: widget.profile.email);
    _hpController = TextEditingController(text: widget.profile.nomorHp);
    _githubController = TextEditingController(text: widget.profile.github);
    _bioController = TextEditingController(text: widget.profile.bio);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _githubController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _simpanPerubahan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final updatedProfile = widget.profile.copyWith(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      prodi: _prodiController.text.trim(),
      kelas: _kelasController.text.trim(),
      email: _emailController.text.trim(),
      nomorHp: _hpController.text.trim(),
      github: _githubController.text.trim(),
      bio: _bioController.text.trim(),
    );

    // Kirim data kembali ke ProfilePage melalui Navigator.pop
    Navigator.pop(context, updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Simpan',
            onPressed: _simpanPerubahan,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap *',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama lengkap wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM *',
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'NIM wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _prodiController,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi *',
                    prefixIcon: Icon(Icons.account_balance),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Program studi wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kelasController,
                  decoration: const InputDecoration(
                    labelText: 'Kelas *',
                    prefixIcon: Icon(Icons.class_),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Kelas wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email *',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Format email tidak valid (contoh: user@mail.com)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _hpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP *',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    hintText: '10-13 digit angka',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }
                    final phoneRegex = RegExp(r'^[0-9]{10,13}$');
                    if (!phoneRegex.hasMatch(value.trim())) {
                      return 'Nomor HP harus berupa angka 10-13 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _githubController,
                  decoration: const InputDecoration(
                    labelText: 'Akun GitHub *',
                    prefixIcon: Icon(Icons.code),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Akun GitHub wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio Singkat',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _simpanPerubahan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Perubahan'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

