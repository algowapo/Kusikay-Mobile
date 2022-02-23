import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  List<SessionReport> sessionReportList = [];

  // TODO: Make TeacherId and token dynamic with SharedPrefs
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final int? teacherId = prefs.getInt('teacherId');
    final String? token = prefs.getString('token');

    sessionReportList = [];
    try {
      Response response = await get(
        Uri.parse('$BACKEND_URL/api/teachers/$teacherId/sessionReports'),
        headers: {
          HttpHeaders.authorizationHeader: token!,
        },
      );
      List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data.length; i++) {
        sessionReportList.add(
          SessionReport(
              data[i]['id'],
              data[i]['classDate'],
              data[i]['comments'],
              data[i]['createdAt'],
              data[i]['description'],
              data[i]['duration'],
              data[i]['hadClass'],
              data[i]['student1'],
              data[i]['student2'],
              data[i]['student3'],
              data[i]['assistanceStudent1'],
              data[i]['assistanceStudent2'],
              data[i]['assistanceStudent3'],
              data[i]['whyNotClass'],
              teacherId,
              data[i]['state']),
        );
      }
    } catch (e) {
      print('caught error $e');
    }
  }

  late SessionReport sessionReport;

  Future<void> createData() async {
    final body = {
      'student1': sessionReport.student1,
      'student2': sessionReport.student2,
      'student3': sessionReport.student3,
      'hadClass': sessionReport.hadClass,
      'classDate': sessionReport.classDate,
      'duration': sessionReport.duration,
      'description': sessionReport.description,
      'comments': sessionReport.comments,
      'whyNotClass': sessionReport.whyNotClass,
      'createdAt': sessionReport.createdAt,
      'state': sessionReport.status
    };
    try {
      Response response = await post(
        Uri.parse('http://10.0.2.2:8080/api/teachers/1/sessionReports'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw'
        },
        body: jsonEncode(body),
      );
      print(response.statusCode);
    } catch (e) {
      print('caught error $e');
    }
  }

  Future<bool> updateData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final body = {
      'student1': sessionReport.student1,
      'student2': sessionReport.student2,
      'student3': sessionReport.student3,
      'assistanceStudent1': sessionReport.assistanceStudent1,
      'assistanceStudent2': sessionReport.assistanceStudent2,
      'assistanceStudent3': sessionReport.assistanceStudent3,
      'hadClass': sessionReport.hadClass,
      'classDate': sessionReport.classDate,
      'duration': sessionReport.duration,
      'description': sessionReport.description,
      'comments': sessionReport.comments,
      'whyNotClass': sessionReport.whyNotClass,
      'createdAt': sessionReport.createdAt,
      'state': sessionReport.status
    };
    try {
      Response response = await put(
        Uri.parse(
            '$BACKEND_URL/api/sessionReports/' + sessionReport.id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token!
        },
        body: jsonEncode(body),
      );
      print(response.body);
      return true;
    } catch (e) {
      print('error update session report $e');
      return false;
    }
  }
}
