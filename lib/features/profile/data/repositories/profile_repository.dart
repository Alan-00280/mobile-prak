import '../models/profile_model.dart';

class ProfileRepository {
  /// Mendapatkan data profile
  Future<List<ProfileModel>> getProfileList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy profile
    return [
      ProfileModel(
        nama: 'John Doe',
        email: 'john.doe@example.com',
        noHp: '081234567890',
        alamat: 'Jl. Merdeka No. 1, Jakarta',
      ),
      ProfileModel(
        nama: 'Jane Smith',
        email: 'jane.smith@example.com',
        noHp: '089876543210',
        alamat: 'Jl. Sudirman No. 45, Bandung',
      ),
    ];
  }
}
