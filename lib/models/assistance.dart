class Assistance {
  int? teacherId;
  bool? assistance;
  String? teacherName;

  Assistance({this.teacherId, this.teacherName, this.assistance});

  factory Assistance.fromJson(Map<dynamic, dynamic> json) {
    return Assistance(
        teacherId: json['teacherId'],
        assistance: json['assistance'],
        teacherName: json['teacherName']);
  }

  Map toJson() => {
        'teacherId': teacherId,
        'assistance': assistance,
      };
}
