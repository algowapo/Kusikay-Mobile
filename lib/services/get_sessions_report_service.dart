import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kusikay_mobile/models/sesion_report_optional.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllSesionsReports {
  Teacher teacher = Teacher();
  List<SessionReportOptional> sessionsReports = [];

  static const BASE_URL = '$BACKEND_URL/api/';

  Future<List<SessionReportOptional>> getAllSesionsReportByTeacher(
      teacherId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    try {
      http.Response sessionsReportResponse = await http.get(
          Uri.parse(BASE_URL + 'teachers/$teacherId/sessionReports'),
          headers: {HttpHeaders.authorizationHeader: token!});
      List<dynamic> sessionsReportData =
          jsonDecode(utf8.decode(sessionsReportResponse.bodyBytes));
      for (var i = 0; i < sessionsReportData.length; i++) {
        sessionsReports
            .add(SessionReportOptional.fromJson(sessionsReportData[i]));
      }
      return sessionsReports;
    } catch (e) {
      print('caught error $e');
      return [];
    }
  }
}
