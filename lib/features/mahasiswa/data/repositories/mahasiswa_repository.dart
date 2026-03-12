import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '10110001',
        email: 'budi.santoso@mhs.example.com',
        jurusan: 'Teknik Informatika',
      ),
      MahasiswaModel(
        nama: 'Siti Aminah',
        nim: '10110002',
        email: 'siti.aminah@mhs.example.com',
        jurusan: 'Sistem Informasi',
      ),
      MahasiswaModel(
        nama: 'Andi Dermawan',
        nim: '10110003',
        email: 'andi.dermawan@mhs.example.com',
        jurusan: 'Teknik Komputer',
      ),
    ];
  }
}
