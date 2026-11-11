class Profile {
  String nama;
  String nim;
  String prodi;
  String kelas;
  String email;
  String nomorHp;
  String github;
  String bio;
  String imageAsset;

  Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.email,
    required this.nomorHp,
    required this.github,
    required this.bio,
    this.imageAsset = 'assets/images/profile.png',
  });

  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? email,
    String? nomorHp,
    String? github,
    String? bio,
    String? imageAsset,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      email: email ?? this.email,
      nomorHp: nomorHp ?? this.nomorHp,
      github: github ?? this.github,
      bio: bio ?? this.bio,
      imageAsset: imageAsset ?? this.imageAsset,
    );
  }

  static Profile initialData() {
    return Profile(
      nama: 'Fikri Bintang Purnomo',
      nim: '1122140142',
      prodi: 'Teknik Informatika',
      kelas: 'PML - Reguler',
      email: 'fikrbintang01@gmail.com',
      nomorHp: '081234567890',
      github: 'github.com/FikriBintangx',
      bio:
          'Mahasiswa Teknik Informatika yang antusias dengan Flutter Mobile Development dan Cyber Security.',
      imageAsset: 'assets/images/profile.png',
    );
  }
}

