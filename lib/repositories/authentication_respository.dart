import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthenticationRepository {
  Future<User> signIn(String phone, String password) async {
    final response = await http.post(
        Uri.https('stagingapi.chipchip.social', '/v1/users/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            "phone": phone,
            "password": password,
            "country": "ETH",
          },
        ));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final token = responseBody['data']['token'];
      final user =  User(phone: phone, token: token, password: password);
      return user;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
