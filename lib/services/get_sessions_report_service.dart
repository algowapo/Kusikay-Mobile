import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kusikay_mobile/models/sesion_report_optional.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/models/student_assistence.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllSesionsReports {
  Teacher teacher = Teacher();
  List<SessionReportOptional> sessionsReports = [];
  Future<List<SessionReportOptional>> getAllSesionsReportByTeacher(
      username) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    try {
      http.Response response = await http.get(
          Uri.parse('http://10.0.2.2:8080/api/teachers/name/$username'),
          headers: {HttpHeaders.authorizationHeader: token!});
      if (response.statusCode == 200) {
        Map teacherData = jsonDecode(utf8.decode(response.bodyBytes));
        teacher.id = teacherData['id'];
        print(teacher.id);
        try {
          http.Response sessionsReportResponse = await http.get(
              Uri.parse(
                  'http://10.0.2.2:8080/api/teachers/${teacher.id}/sessionReports'),
              headers: {HttpHeaders.authorizationHeader: token});
          List<dynamic> sessionsReportData =
              jsonDecode(utf8.decode(sessionsReportResponse.bodyBytes));
          for (var i = 0; i < sessionsReportData.length; i++) {
            sessionsReports
                .add(SessionReportOptional.fromJson(sessionsReportData[i]));
          }
          return sessionsReports;
        } catch (e) {
          print('caught error 2 $e');
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      print('caught error $e');
      return [];
    }
  }
}
