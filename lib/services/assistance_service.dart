import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/assistance.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AssistanceService {
  static const BASE_URL = 'http://10.0.2.2:8080/api/';

  Future<List<Assistance>> getAssistance(meetingId) async {
    List<Assistance> assistance = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      Response response = await get(
          Uri.parse(BASE_URL + 'meetings/$meetingId/assists'),
          headers: {HttpHeaders.authorizationHeader: token!});

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      //print(data);
      for (var i = 0; i < data.length; i++) {
        assistance.add(Assistance.fromJson(data[i]));
      }
      return assistance;
    } catch (e) {
      print(e);
      print('error get assistance');
      return [];
    }
  }

  Future<bool> createAssistance(List<Assistance> assistances, meetingId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      await post(Uri.parse(BASE_URL + 'meetings/$meetingId/assists'),
          body:
              jsonEncode(<String, List<Assistance>>{"assistance": assistances}),
          headers: {
            HttpHeaders.authorizationHeader: token!,
            HttpHeaders.contentTypeHeader: 'application/json'
          });
      return true;
    } catch (e) {
      print(e);
      print('error create assistance');
      return false;
    }
  }
}
