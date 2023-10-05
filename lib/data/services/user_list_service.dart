import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:voco_app/data/models/user_model.dart';

class UserListService {
  final String baseUrl = 'https://reqres.in/api';

  Future<List<UserData>> getAllUsers() async {
    List<UserData> allUsers = [];
    int page = 1;
    int perPage = 6;

    while (true) {
      final Uri userListUri =
          Uri.parse('$baseUrl/users?page=$page&per_page=$perPage');

      try {
        final response = await http.get(userListUri);

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          final userList = UsersResponseModel.fromJson(responseData);
          allUsers.addAll(userList.data);
          page++;
          perPage = userList.perPage;
          if (page > userList.totalPages) {
            break;
          }
        } else {
          throw Exception(
              'Kullanıcı listesi alınamadı: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Kullanıcı listesi alınırken hata oluştu: $e');
      }
    }

    return allUsers;
  }
}
