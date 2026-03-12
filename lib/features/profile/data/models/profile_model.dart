class ProfileModel {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;

  ProfileModel({
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
      noHp: json['noHp'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'noHp': noHp,
      'alamat': alamat,
    };
  }
}