import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/dosen_model.dart';
// import 'package:http/http.dart' as http;

// class DosenRepository {
//   /// Mendapatkan daftar dosen
//   Future<List<DosenModel>> getDosenList() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typecode.com/users'),
//       headers: {'Accept': 'application/json'}
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => DosenModel.fromJson(json)).toList();
//     } else {
//       print('Error: ${response.statusCode} - ${response.body}');
//       throw Exception('Gagal memuat data Dosen: ${response.statusCode}');
//     }
//   }
// }

class DosenRepository {
  final Dio _dio = Dio(BaseOptions(
    headers: {'Accept': 'application/json'},
  ));

  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode} - ${e.response?.data}');
      throw Exception('Gagal memuat data Dosen: ${e.response?.statusCode}');
    }
  }
}
