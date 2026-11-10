# UTS Pemrograman Mobile Lanjutan (Flutter) - Soal 1

Aplikasi Profil Mahasiswa (Live Coding StatelessWidget) - KB1185 Institut Teknologi & Bisnis Bina Sarana Global.

## 👤 Identitas Mahasiswa
- **Nama**: Fikri Bintang Purnomo
- **NIM**: 1122140142
- **Program Studi**: Teknik Informatika
- **Kelas**: Pemrograman Mobile Lanjutan (PML)
- **Dosen Pengampu**: IKetut Gunawan

---

## 📌 Ketentuan & Karakteristik Soal 1
- **Arsitektur Widget**: 100% `StatelessWidget` (bebas dari `StatefulWidget` & `setState()`).
- **Tema**: Mendukung Material 3 (`useMaterial3: true`), Light Theme, dan Dark Theme mengikuti sistem OS (`ThemeMode.system`).
- **Layout**: `SafeArea` -> `SingleChildScrollView` -> `Padding` -> `Column` (bebas overflow).
- **Reusable Widget**: `InfoTile` dengan konstruktor `const` & parameter `final`.
- **Card**:
  - **Card Kontak**: Email, Nomor HP, Kelas, dan Akun GitHub.
  - **Card Keahlian / Hobi**: Flutter & Dart, App Security, UI/UX Design.
- **Interaksi**: `FloatingActionButton` yang memicu `SnackBar` *"Terima kasih telah melihat profil saya"*.

---

## 🚀 Cara Menjalankan Aplikasi
```bash
# Ambil dependencies
flutter pub get

# Jalankan static analyzer
flutter analyze

# Jalankan pengujian unit / widget
flutter test

# Jalankan di device / emulator
flutter run
```
