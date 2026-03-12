import 'dart:io';

void main(List<String> args) {
  // List kosongan
  List<String> listData = [];
  print('List kosongan: $listData');

  // Ambil jumlah data
  int dataLength = 0;
  while (dataLength <= 0) {
    stdout.write('Masukkan Jumlah Data: ');
    String? input = stdin.readLineSync();
    try {
      dataLength = int.parse(input!);
      if (dataLength <= 0) {
        print('Masukkan input lebih dari 0!');
      }
    } catch (e) {
      print('Masukkan data valid!');
      print('error: $e');
    }
  }

  // Input data dengan looping
  for (var i = 0; i < dataLength; i++) {
    stdout.write('Masukkan data ke- ${i+1}: ');
    String? dataInput = stdin.readLineSync();
    listData.add(dataInput!);
  }

  // Output data
  print('Data List: ${listData}');

  // Berdasarkan index tertentu
  int idx = -1;
  while (idx <= 0 || idx > listData.length) {
    stdout.write('Masukkan index untuk dioutput: ');
    String? input = stdin.readLineSync();
    try {
      idx = int.parse(input!);
      if (idx <= 0 || idx > listData.length) {
        print('Index tidak ditemukkan!');
      }
    } catch (e) {
      print('err: $e');
    }
  }
  print('Data index ke- $idx : ${listData[idx]}');

  // Ubah data idx tertentu
  idx = -1;
  while (idx <= 0 || idx > listData.length) {
    stdout.write('Masukkan index untuk diubah: ');
    String? input = stdin.readLineSync();
    try {
      idx = int.parse(input!);
      if (idx <= 0 || idx > listData.length) {
        print('Index tidak ditemukkan!');
      }
    } catch (e) {
      print('err: $e');
    }
  }

  stdout.write('Masukkan data baru untuk index ke- $idx: ');
  String? newData = stdin.readLineSync()!;
  listData[idx] = newData;

  print('Data sekarang: $listData');

  // Hapus berdasarkan index
  idx = -1;
  while (idx <= 0 || idx > listData.length) {
    stdout.write('Masukkan index untuk dihapus: ');
    String? input = stdin.readLineSync();
    try {
      idx = int.parse(input!);
      if (idx <= 0 || idx > listData.length) {
        print('Index tidak ditemukkan!');
      }
    } catch (e) {
      print('err: $e');
    }
  }
  listData.removeAt(idx);
  print('Data sekarang: $listData');

  // Hasil Akhir
  print('======== SEMUA DATA ========');
  for (var i = 0; i < listData.length; i++) {
    print('index $i: ${listData[i]}');
  }

}
