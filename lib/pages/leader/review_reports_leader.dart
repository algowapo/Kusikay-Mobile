import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/sesion_report_optional.dart';
import 'package:kusikay_mobile/models/student_assistence.dart';
import 'package:kusikay_mobile/services/get_sessions_report_service.dart';
import 'package:kusikay_mobile/widgets/kusikay_appbar.dart';
import 'package:kusikay_mobile/widgets/report_card_students.dart';

class ReviewReportsTeacherLeader extends StatefulWidget {
  const ReviewReportsTeacherLeader(
      {Key? key, required this.nameTeacher, required this.teacherId})
      : super(key: key);
  final String nameTeacher;
  final int teacherId;

  @override
  _ReviewReportsTeacherLeaderState createState() =>
      _ReviewReportsTeacherLeaderState();
}

class _ReviewReportsTeacherLeaderState
    extends State<ReviewReportsTeacherLeader> {
  static bool _showingBenefits = false;
  int sessionsReportPendingCounter = 0;

  List<Student> students = [];
  List<SessionReportOptional> sessionsReports = [];
  GetAllSesionsReports getAllSesionsReports = GetAllSesionsReports();

  void assignData() {
    setState(() {
      sessionsReports = getAllSesionsReports.sessionsReports;
      sessionsReports.sort((sessionreport1, sessionreport2) =>
          sessionreport2.classDate!.compareTo(sessionreport1.classDate!));
      for (int i = 0; i < sessionsReports.length; i++) {
        if (sessionsReports[i].state == 'pendiente') {
          sessionsReportPendingCounter = sessionsReportPendingCounter + 1;
        }
        if (i == 0) {
          students.add(Student(
              fullName: sessionsReports[i].student1,
              absenceCounter:
                  sessionsReports[i].assistanceStudent1 == false ? 1 : 0));
          students.add(Student(
              fullName: sessionsReports[i].student2,
              absenceCounter:
                  sessionsReports[i].assistanceStudent2 == false ? 1 : 0));
          students.add(Student(
              fullName: sessionsReports[i].student1,
              absenceCounter:
                  sessionsReports[i].assistanceStudent3 == false ? 1 : 0));
        }
      }
    });
    for (int i = 0; i < students.length; i++) {
      print(students[i].fullName);
      print(students[i].absenceCounter);
    }
  }

  void getSessionsReports() async {
    print(widget.teacherId);
    await getAllSesionsReports.getAllSesionsReportByTeacher(widget.teacherId);
    assignData();
  }

  void _benefitsTabTapped() {
    setState(() {
      _showingBenefits = !_showingBenefits;
    });
  }

  @override
  void initState() {
    super.initState();
    getSessionsReports();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: KusikayAppBar(context,
            onBenefitTap: _benefitsTabTapped, back: false),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 10.0),
                child: Text(
                  widget.nameTeacher,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'El artista tiene pendiente llenar ${sessionsReportPendingCounter} informes',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Center(
                  child: Container(
                    width: width * 0.90,
                    decoration: BoxDecoration(
                        color: KColors.red,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "El alumno Gion Pequis tiene 3 ausencias",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.notification_important_rounded,
                              color: Colors.white,
                              size: 22.0,
                            )
                          ]),
                    ),
                  ),
                ),
              ),
              Container(
                  height: height * 0.59,
                  width: width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: width * 0.05,
                        crossAxisSpacing: width * 0.06,
                        childAspectRatio: 1.25),
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(width * 0.06),
                    itemCount: sessionsReports.length,
                    itemBuilder: (BuildContext context, int index) {
                      var sessionsReport = sessionsReports[index];
                      DateFormat formatDay = DateFormat('dd MMMM');
                      DateFormat formatHour = DateFormat('hh:mm');
                      var dateSesionReport =
                          formatDay.format(sessionsReport.classDate!);
                      var hourStartClass =
                          formatHour.format(sessionsReport.classDate!);
                      DateTime hourFinishClass = sessionsReport.classDate!
                          .add(Duration(hours: sessionsReport.duration!));
                      var hourFinishClassString =
                          formatHour.format(hourFinishClass);
                      String horita =
                          hourStartClass + ' - ' + hourFinishClassString;
                      return ReportCardStudents(
                        status: sessionsReport.state.toString(),
                        date: dateSesionReport,
                        time: horita,
                        student1: sessionsReport.student1.toString(),
                        student2: sessionsReport.student2.toString(),
                        student3: sessionsReport.student3.toString(),
                      );
                    },
                  ))
            ])));
  }
}
