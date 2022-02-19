import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class MeetingService {
  static const BASE_URL = 'http://10.0.2.2:8080/api/';

  Future<bool> createMeeting(
      name, description, DateTime date, TimeOfDay hour) async {
    try {
      var startTime =
          date.add(Duration(hours: hour.hour, minutes: hour.minute));
      var finishTime =
          date.add(Duration(hours: (hour.hour + 1), minutes: hour.minute));
      Response response = await post(Uri.parse(BASE_URL + 'teachers/1/meeting'),
          body: jsonEncode(<String, String>{
            'name': name,
            'description': description,
            'startTime': startTime.toString(),
            'finishTime': finishTime.toString()
          }),
          headers: {
            HttpHeaders.authorizationHeader:
                'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw',
            HttpHeaders.contentTypeHeader: 'application/json'
          });
      if (response.statusCode == 200) {
        return true;
      }

      print(name);
      print(description);
      print('${startTime.toString()}');
      print('${finishTime.toString()}');
      return true;
    } catch (e) {
      print(e);
      print('error courses');
      return false;
    }
  }
}
