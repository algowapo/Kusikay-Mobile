import 'dart:convert';
import 'dart:io';
import 'package:kusikay_mobile/models/token_user_data.dart';
import 'package:http/http.dart' as http;
import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

var urlLogin = Uri.parse('$BACKEND_URL/api/autenticar');

class LoginService {
  Future<TokenUserData> login(username, password) async {
    final tokenUserData = TokenUserData(0, '', '', '', '', false);
    int teacherId = 0;
    // * Validation login
    http.Response token = await http.post(
      urlLogin,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    if (token.statusCode == 200) {
      Map teacherData = jsonDecode(token.body);

      tokenUserData.token = teacherData['token'];
      tokenUserData.role = teacherData['role'];
      teacherId = teacherData['teacherId'];

      print(tokenUserData.toString());
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', tokenUserData.token);
    await prefs.setString('role', tokenUserData.role);
    await prefs.setInt('teacherId', teacherId);

    return tokenUserData;
  }
}
