import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/utils/config.dart';

class SessionService {
  List<SessionReport> sessionReportList = [];

  // TODO: Make TeacherId and token dynamic with SharedPrefs
  Future<void> getData() async {
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
}
