import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

class ApiService {

  static  Future<List<Model>> fetchStudent() async {
    final response = await http.get(Uri.parse("https://6a7eb3d73183f5fd884a590f.mockapi.io/student"));

    if(response.statusCode == 200){
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Model.fromJson(json)).toList();
    }else{
      throw Exception("ไม่สามารถโหลดข้อมูลได้");
    }
  }
}