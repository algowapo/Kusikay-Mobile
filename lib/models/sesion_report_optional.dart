import 'package:kusikay_mobile/utils/util.dart';

class SessionReportOptional {
  int? id;
  DateTime? classDate;
  String? comments;
  String? createdAt;
  String? description;
  int? duration;
  bool? hadClass;
  String? student1;
  String? student2;
  String? student3;
  String? whyNotClass;
  String? state;
  bool? assistanceStudent1;
  bool? assistanceStudent2;
  bool? assistanceStudent3;

  SessionReportOptional(
      {this.id,
      this.classDate,
      this.comments,
      this.createdAt,
      this.description,
      this.duration,
      this.hadClass,
      this.student1,
      this.student2,
      this.student3,
      this.whyNotClass,
      this.state,
      this.assistanceStudent1,
      this.assistanceStudent2,
      this.assistanceStudent3});

  factory SessionReportOptional.fromJson(Map<dynamic, dynamic> json) {
    return SessionReportOptional(
        id: json['id'],
        classDate: json['classDate'] != null
            ? stringToDatetime(json['classDate'])
            : null,
        comments: json['comments'],
        createdAt: json['createdAt'],
        description: json['description'],
        duration: json['duration'],
        hadClass: json['hadClass'],
        student1: json['student1'],
        student2: json['student2'],
        student3: json['student3'],
        whyNotClass: json['whyNotClass'],
        state: json['state'],
        assistanceStudent1: json['assistanceStudent1'],
        assistanceStudent2: json['assistanceStudent2'],
        assistanceStudent3: json['assistanceStudent3']);
  }
}
