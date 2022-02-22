import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/course.dart';
import 'dart:convert';

import 'package:kusikay_mobile/utils/config.dart';

class CourseService {
  static const BASE_URL = '$BACKEND_URL/api/';

  Future<List<Course>> getCourses() async {
    List<Course> courses = [];
    try {
      Response response = await get(Uri.parse(BASE_URL + 'courses'), headers: {
        HttpHeaders.authorizationHeader:
            'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw'
      });

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      //print(data);
      for (var i = 0; i < data.length; i++) {
        //print(Course.fromJson(data[i]));
        courses.add(Course.fromJson(data[i]));
      }
      return courses;
    } catch (e) {
      print(e);
      print('error courses');
      return [];
    }
  }
}
