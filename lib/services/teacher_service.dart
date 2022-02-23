import 'dart:io';
import 'package:http/http.dart';
import 'package:kusikay_mobile/models/assistance.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'dart:convert';

import 'package:kusikay_mobile/models/teacher_schedule.dart';
import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherService {
  static const BASE_URL = '$BACKEND_URL/api';

  Future<List<TeacherSchedule>> getTeacherSchedule() async {
    List<TeacherSchedule> teacherSchedule = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? teacherId = prefs.getInt('teacherId');

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

  Future<List<Teacher>> getTeachersByLeaderId() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? leaderId = prefs.getInt('teacherId');

    List<Teacher> teachers = [];

    try {
      Response response = await get(Uri.parse(BASE_URL + '/leaders/$leaderId'),
          headers: {HttpHeaders.authorizationHeader: token!});

      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> content = data["content"];

      for (var i = 0; i < content.length; i++) {
        teachers.add(Teacher.fromJson(content[i]));
      }

      return teachers;
    } catch (e) {
      print(e);
      print('Error get teachers by Id');
      return [];
    }
  }

  Future<List<Assistance>> getTeachersByMeetingId(int meetingId) async {
    List<Teacher> teachers = [];
    List<Assistance> teachersAssistance = [];
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    try {
      Response response = await get(
          Uri.parse(BASE_URL + '/meetings/$meetingId/teachers'),
          headers: {HttpHeaders.authorizationHeader: token!});

      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> content = data["content"];

      for (var i = 0; i < content.length; i++) {
        Assistance a = Assistance(
            teacherId: Teacher.fromJson(content[i]).id,
            teacherName: Teacher.fromJson(content[i]).name,
            assistance: false);

        teachersAssistance.add(a);
      }

      return teachersAssistance;
    } catch (e) {
      print(e);
      print('Error get teachers by Meeting Id assistance');
      return [];
    }
  }
}
