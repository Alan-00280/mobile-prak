void main(List<String> args) {
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names: $names');

  // Menambahkan data list
  names.add('Rifki');
  print('Names setelah ditambahkan data: $names');

  // Tampilkan data tertentu
  print('Elemen pertama: ${names[0]} \nElemen Kedua: ${names[1]}');

  // Mengubah data di index tertentu
  names[1] = 'Taufik';
  print('Names setelah diubah: $names');

  // Hapus data tertentu
  names.remove('Taufik');
  print('Names setelah dihapus: $names');

  // Jumlah data
  print('Jumlah data: ${names.length}');

  // Looping print data
  print('Menampilkan setiap elemen names:');
  for (String name in names) {
    print(name);
  }

}
