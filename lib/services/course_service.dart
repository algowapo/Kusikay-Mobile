import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/course.dart';
import 'dart:convert';

import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseService {
  static const BASE_URL = '$BACKEND_URL/api/';

  Future<List<Course>> getCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    List<Course> courses = [];
    try {
      Response response = await get(Uri.parse(BASE_URL + 'courses'),
          headers: {HttpHeaders.authorizationHeader: token!});

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
