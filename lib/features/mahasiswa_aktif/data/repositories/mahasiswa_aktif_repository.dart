import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/mahasiswa_aktif_model.dart';
import 'package:http/http.dart' as http;

// class MahasiswaAktifRepository {
//   /// Mendapatkan daftar mahasiswa aktif
//   Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
//     final response = await http.get(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//       headers: {'Accept': 'application/json'} 
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
//     } else {
//       print('Error: ${response.statusCode} - ${response.body}');
//       throw Exception('Gagal memuat data Dosen: ${response.statusCode}');
//     }    
//   }
// }

class MahasiswaAktifRepository {
  final Dio _dio = Dio(BaseOptions(
    headers: {'Accept': 'application/json'}
  ));

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts'
      );

      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode} - ${e.response?.data}');
      throw Exception('Gagal memuat data Dosen: ${e.response?.statusCode}');
    }
  }
}
