import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/utils/config.dart';

class SessionService {
  List<SessionReport> sessionReportList = [];

  // TODO: Make TeacherId and token dynamic with SharedPrefs
  Future<void> getData() async {
    sessionReportList = [];
    try {
      Response response = await get(
        Uri.parse('$BACKEND_URL/api/teachers/1/sessionReports'),
        headers: {
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw',
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
              data[i]['whyNotClass'],
              1, //TODO: Make TeacherId dynamic
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

  Future<void> updateData() async {
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
      Response response = await put(
        Uri.parse('http://10.0.2.2:8080/api/sessionReports/' +
            sessionReport.id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnaW5vIn0.bCcj99sO-yCeKqTfxBEUMinv8ei5EEsSDZy-mG1tjHaE6Z4Pn9YB7bJCrUOaqp-1pV1vXIBiPcNTY7KFWh12Zw'
        },
        body: jsonEncode(body),
      );
      print(response.body);
    } catch (e) {
      print('caught error $e');
    }
  }
}
