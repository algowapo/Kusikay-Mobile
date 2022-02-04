import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:kusikay_mobile/models/teacher_schedule.dart';

class TeacherService{
  static const BASE_URL = 'http://10.0.2.2:8080/api';

  Future<List<TeacherSchedule>> getTeacherSchedule(teacherId) async {
    List<TeacherSchedule> teacherSchedule = [];
    try {
      Response response = await get(
        Uri.parse(BASE_URL + '/teachers/$teacherId/schedule'),
        headers: {
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw'
        }
      );

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      //print(data);
      for (var i = 0; i < data.length; i++){
       teacherSchedule.add(TeacherSchedule.fromJson(data[i]));
      }

      return teacherSchedule;


    }
    catch(e){
      print(e);
      print('error');
      return [];
    }
  }

}
