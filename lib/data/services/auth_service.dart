import 'package:http/http.dart' as http;
import 'package:voco_app/data/models/user_request_model.dart';
import 'dart:convert';

import 'package:voco_app/data/models/user_response_model.dart';

class AuthService {
  final String baseUrl = 'https://reqres.in/api';

  Future<UserResponseModel> login(UserRequestModel model) async {
    final Uri loginUri = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(loginUri, body: model.toJson());
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];
        var userResponseModel = UserResponseModel(token: token);
        return userResponseModel;
      } else if (response.statusCode == 401) {
        throw Exception('Kullanıcı adı veya şifre yanlış.');
      } else {
        throw Exception('Giriş sırasında hata oluştu: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
