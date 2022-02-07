import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'dart:convert';

import 'package:kusikay_mobile/models/teacher_schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherService {
  static const BASE_URL = 'http://10.0.2.2:8080/api';

  Future<List<TeacherSchedule>> getTeacherSchedule() async {
    List<TeacherSchedule> teacherSchedule = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    //suponiendo que useris es el mismo de teacher
    final int? teacherId = prefs.getInt('userId');

    try {
      Response response = await get(
          Uri.parse(BASE_URL + '/teachers/$teacherId/schedule'),
          headers: {HttpHeaders.authorizationHeader: token!});

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data.length; i++) {
        teacherSchedule.add(TeacherSchedule.fromJson(data[i]));
      }

      return teacherSchedule;
    } catch (e) {
      print(e);
      print('error_schedule');
      return [];
    }
  }

  Future<List<Teacher>> getTeachers() async {
    List<Teacher> teachers = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    try {
      Response response = await get(Uri.parse(BASE_URL + '/teachers'),
          headers: {HttpHeaders.authorizationHeader: token!});

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data.length; i++) {
        teachers.add(Teacher.fromJson(data[i]));
      }

      return teachers;
    } catch (e) {
      print(e);
      print('error teachers');
      return [];
    }
  }

  Future<List<Teacher>> getTeachersByCourseId(int courseId) async {
    List<Teacher> teachers = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    try {
      Response response = await get(
          Uri.parse(BASE_URL + '/courses/$courseId/teachers'),
          headers: {HttpHeaders.authorizationHeader: token!});

      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

      for (var i = 0; i < data.length; i++) {
        teachers.add(Teacher.fromJson(data[i]));
      }

      Map<int, Teacher> mp = {};
      for (var item in teachers) {
        mp[item.id!] = item;
      }

      return mp.values.toList();
    } catch (e) {
      print(e);
      print('error teachers courseId');
      return [];
    }
  }
}
