import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/benefit.dart';
import 'dart:convert';

import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BenefitService {
  static const BASE_URL = '$BACKEND_URL/api/';

  Future<List<Benefit>> getBenefits() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    List<Benefit> benefits = [];
    try {
      Response response = await get(Uri.parse(BASE_URL + 'benefits'),
          headers: {HttpHeaders.authorizationHeader: token!});

      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> content = data["content"];

      //print(data);
      for (var i = 0; i < content.length; i++) {
        benefits.add(Benefit.fromJson(content[i]));
      }
      return benefits;
    } catch (e) {
      print(e);
      print('error benefits');
      return [];
    }
  }
}
