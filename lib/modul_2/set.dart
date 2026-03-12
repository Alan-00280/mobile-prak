import 'dart:io';

void main(List<String> args) {
  Set<String> handphone = {'Vivo', 'IPhone', 'Redmi', 'Oppo'};
  print('Handphone: $handphone');

  // Input data baru
  stdout.write('Masukkan nama hp baru: ');
  String? newHp = stdin.readLineSync()!;
  handphone.add(newHp);
  print('Handphone sekarang: $handphone');

  // Input data duplicate
  String input = '';
  while(!handphone.contains(input)) {
    stdout.write('Masukkan nama hp yang sama: ');
    input = stdin.readLineSync()!;
    if (!handphone.contains(input)) {
      print('Masukkan data hp yang sama!');
    }
  }

  handphone.add(input);
  print('Handphone sekarang: $handphone');

  // Hapus data
  input = '';
  while(!handphone.contains(input)) {
    stdout.write('Masukkan nama hp yang akan dihapus: ');
    input = stdin.readLineSync()!;
    if (!handphone.contains(input)) {
      print('Masukkan data hp yang ada!');
    }
  }

  handphone.remove(input);
  print('Handphone sekarang: $handphone');

  // Cek data tertentu ada atau tidak
  stdout.write('Cek apakah ada nama hp: ');
  input = stdin.readLineSync()!;
  if (handphone.contains(input)) {
    print('Hasil: Ada');
  } else {
    print('Hasil: Tidak Ada');
  }

  //Hitung Jumlah data
  print('Jumlah data pada Set: ${handphone.length}');

  // Semua data
  print('====== SEMUA DATA ======');
  for (var i = 0; i < handphone.length; i++) {
    print('${i+1}. ${handphone.elementAt(i)}');
  }

}
