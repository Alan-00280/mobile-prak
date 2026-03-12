import 'dart:io';

void main(List<String> args) {
  Map<String, String> data = {
    'Juan': '434241077',
    'Hanna': '434241121',
    'Doni': '434241021',
  };
  print('data: $data');

  // Tambah data
  data['Jane'] = '434221067';
  print('data: $data');

  // Output berdasarkan key
  print('NIM dari Juan: ${data['Juan']}');

  // Ubah Data
  String? inputKey = '';
  while (!data.containsKey(inputKey)) {
    stdout.write('Masukkan Key untuk diubah: ');
    inputKey = stdin.readLineSync();
    if (!data.containsKey(inputKey)) {
      print('Data dengan key $inputKey tidak ditemukan');
    } else {
      print('Data: {$inputKey: ${data[inputKey]}}');
    }
  }
  stdout.write('Masukkan data baru untuk $inputKey: ');
  String? newData = stdin.readLineSync();
  data[inputKey!] = newData!;
  print('Data sekarang: $data');

  // Hapus Data
  inputKey = '';
  while (!data.containsKey(inputKey)) {
    stdout.write('Masukkan Key untuk dihapus: ');
    inputKey = stdin.readLineSync();
    if (!data.containsKey(inputKey)) {
      print('Data dengan key $inputKey tidak ditemukan');
    } else {
      print('Menghapus Data: {$inputKey: ${data[inputKey]}}');
    }
  }
  data.remove(inputKey);
  print('Data sekarang: $data');

  // Cek data dari key
  inputKey = '';
  while (!data.containsKey(inputKey)) {
    stdout.write('Masukkan Key diperiksa: ');
    inputKey = stdin.readLineSync();
    if (!data.containsKey(inputKey)) {
      print('Data dengan key $inputKey tidak ditemukan');
    } else {
      print('Ditemukan data: {$inputKey: ${data[inputKey]}}');
    }
  }

  // Jumlah data
  print('Jumlah data: ${data.length}');
  // Semua key
  print('Tampilkan semua keys: ${data.keys}');
  // Semua values
  print('Tampilkan semua values: ${data.values}');

}
