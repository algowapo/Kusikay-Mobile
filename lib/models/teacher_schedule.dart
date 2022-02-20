import 'package:kusikay_mobile/utils/util.dart';

class TeacherSchedule {
  int? classId;
  int? meetingId;

  //class
  String? classWeekDay;
  DateTime? classFinishTime;
  DateTime? classStartTime;
  String? classCourseName;

  //meeting
  String? meetingName;
  String? meetingDescription;
  DateTime? meetingStartTime;
  DateTime? meetingFinishTime;
  bool? finished;

  TeacherSchedule(
      {this.classId,
      this.meetingId,
      this.classWeekDay,
      this.classFinishTime,
      this.classStartTime,
      this.classCourseName,
      this.meetingName,
      this.meetingDescription,
      this.meetingStartTime,
      this.meetingFinishTime,
      this.finished});

  factory TeacherSchedule.fromJson(Map<dynamic, dynamic> json) {
    return TeacherSchedule(
        classId: json['classId'],
        meetingId: json['meetingId'],
        classWeekDay: json['classWeekDay'],
        classFinishTime: json['classFinishTime'] != null
            ? stringToDatetime(json['classFinishTime'])
            : null,
        classStartTime: json['classStartTime'] != null
            ? stringToDatetime(json['classStartTime'])
            : null,
        classCourseName: json['classCourseName'],
        meetingName: json['meetingName'],
        meetingDescription: json['meetingDescription'],
        meetingStartTime: json['meetingStartTime'] != null
            ? stringToDatetime(json['meetingStartTime'])
            : null,
        meetingFinishTime: json['meetingFinishTime'] != null
            ? stringToDatetime(json['meetingFinishTime'])
            : null,
        finished: json['finished']);
  }
}
