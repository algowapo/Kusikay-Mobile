import 'dart:convert';
import 'dart:io';
import 'package:kusikay_mobile/models/token_user_data.dart';
import 'package:http/http.dart' as http;

var urlLogin = Uri.parse('http://10.0.2.2:8080/login');

class LoginService {
  Future<TokenUserData> login(username, password) async {
    final tokenUserData = TokenUserData(0, '', '', '', '', false);
    // * Validation login
    http.Response token = await http.post(
      urlLogin,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (token.statusCode == 200) {
      Map<String, String> headers = token.headers;
      tokenUserData.token = headers['authorization'].toString();
      print('el token es: ${tokenUserData.token}');
      // * Get user data by username using token authentication
      http.Response userResponse = await http.get(
          Uri.parse('http://10.0.2.2:8080/api/username/$username'),
          headers: {
            HttpHeaders.authorizationHeader: tokenUserData.token.toString()
          });
      Map userdata = jsonDecode(userResponse.body);
      tokenUserData.id = userdata['id'];
      tokenUserData.username = userdata['username'];
      tokenUserData.password = userdata['password'];
      tokenUserData.role = userdata['role'];
      tokenUserData.enabled = userdata['enabled'];
    }
    return tokenUserData;
  }
}
