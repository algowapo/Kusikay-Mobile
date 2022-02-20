class SessionReport {
  late int id;
  late String classDate;
  late String comments;
  late String createdAt;
  late String description;
  late int duration;
  late bool hadClass;
  late String student1;
  late String student2;
  late String student3;
  late String whyNotClass;
  late int teacherId;
  late String status;

  SessionReport(
      this.id,
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
      this.teacherId,
      this.status);
}
