// import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/mahasiswa_model.dart';
// import 'package:http/http.dart' as http;

// class MahasiswaRepository {
//   /// Mendapatkan daftar mahasiswa
//   Future<List<MahasiswaModel>> getMahasiswaList() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/comments'),
//       headers: {'Accept': 'application/json'} 
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => MahasiswaModel.fromJson(json)).toList();
//     } else {
//       print('Error: ${response.statusCode} - ${response.body}');
//       throw Exception('Gagal memuat data Dosen: ${response.statusCode}');
//     }
//   }
// }

class MahasiswaRepository {
  final Dio _dio = Dio(BaseOptions(
    headers: {'Accept': 'application/json'}
  ));

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments'
      );

      final List<dynamic> data = response.data;
      // print(data);
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode} - ${e.response?.data}');
      throw Exception('Gagal memuat data Dosen: ${e.response?.statusCode}');
    }
  }
}