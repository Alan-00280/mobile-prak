import 'dart:io';

void main(List<String> args) {
  Map<String, String> mahasiswa_single = {
    'NIM': '',
    'Nama': '',
    'Jurusan': '',
    'IPK': ''
  };

  // Single Input
  print('=== INPUT DATA MAHASISWA ===');
  stdout.write('Masukkan NIM: ');
  String? inputNIM = stdin.readLineSync();
  mahasiswa_single['NIM'] = inputNIM!;

  stdout.write('Masukkan Nama: ');
  String? inputNama = stdin.readLineSync();
  mahasiswa_single['Nama'] = inputNama!;

  stdout.write('Masukkan Jurusan: ');
  String? inputJurusan = stdin.readLineSync();
  mahasiswa_single['Jurusan'] = inputJurusan!;

  stdout.write('Masukkan IPK: ');
  String? inputIPK = stdin.readLineSync();
  mahasiswa_single['IPK'] = inputIPK!;

  print('Mahasiswa: $mahasiswa_single');
  
  // Multiple Output
  List daftar_mahasiswa = [];

  int n = 0;
  while (n <= 0) {
    stdout.write('Berapa Jumlah Data yang dimasukkan: ');
    n = int.parse(stdin.readLineSync()!);
    if (n <= 0) {
      print('Masukkan lebih dari 0');
    }
  }

  for (var i = 0; i < n; i++) {
    print("--- Mahasiswa ke ${i+1} ---");
    stdout.write('Masukkan NIM: ');
    String? inputNIM = stdin.readLineSync();
    mahasiswa_single['NIM'] = inputNIM!;

    stdout.write('Masukkan Nama: ');
    String? inputNama = stdin.readLineSync();
    mahasiswa_single['Nama'] = inputNama!;

    stdout.write('Masukkan Jurusan: ');
    String? inputJurusan = stdin.readLineSync();
    mahasiswa_single['Jurusan'] = inputJurusan!;

    stdout.write('Masukkan IPK: ');
    String? inputIPK = stdin.readLineSync();
    mahasiswa_single['IPK'] = inputIPK!;

    daftar_mahasiswa.add(mahasiswa_single);
  }
  print('daftar mahasiswa: $daftar_mahasiswa');


}
