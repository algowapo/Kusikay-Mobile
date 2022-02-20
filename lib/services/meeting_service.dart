import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MeetingService {
  static const BASE_URL = 'http://10.0.2.2:8080/api/';

  Future<bool> createMeeting(
      name, description, DateTime date, TimeOfDay hour) async {
    final prefs = await SharedPreferences.getInstance();
    final int? teacherId = prefs.getInt('teacherId');
    final String? token = prefs.getString('token');

    try {
      var startTime =
          date.add(Duration(hours: hour.hour, minutes: hour.minute));
      var finishTime =
          date.add(Duration(hours: (hour.hour + 1), minutes: hour.minute));
      Response response =
          await post(Uri.parse(BASE_URL + 'teachers/$teacherId/meeting'),
              body: jsonEncode(<String, String>{
                'name': name,
                'description': description,
                'startTime': startTime.toString(),
                'finishTime': finishTime.toString()
              }),
              headers: {
            HttpHeaders.authorizationHeader: token!,
            HttpHeaders.contentTypeHeader: 'application/json'
          });
      if (response.statusCode == 200) {
        return true;
      }
      return true;
    } catch (e) {
      print(e);
      print('error courses');
      return false;
    }
  }
}
