import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  /// Mendapatkan daftar mahasiswa aktif
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa aktif
    return [
      MahasiswaAktifModel(
        nama: 'Agus Pratama',
        nim: '10110004',
        email: 'agus.p@mhs.example.com',
        jurusan: 'Teknik Informatika',
        semester: 4,
      ),
      MahasiswaAktifModel(
        nama: 'Cinta Laura',
        nim: '10110005',
        email: 'cinta.l@mhs.example.com',
        jurusan: 'Ilmu Komunikasi',
        semester: 6,
      ),
      MahasiswaAktifModel(
        nama: 'Dian Sastro',
        nim: '10110006',
        email: 'dian.s@mhs.example.com',
        jurusan: 'Sastra Inggris',
        semester: 2,
      ),
    ];
  }
}
