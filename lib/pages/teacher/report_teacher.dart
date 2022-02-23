import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/services/session_service.dart';
import 'package:kusikay_mobile/utils/util.dart';
import 'package:kusikay_mobile/widgets/create_session_report_dialog.dart';
import 'package:kusikay_mobile/widgets/report_card.dart';
import 'package:kusikay_mobile/widgets/session_report_dialog.dart';

class ReportTeacher extends StatefulWidget {
  const ReportTeacher({Key? key}) : super(key: key);

  @override
  State<ReportTeacher> createState() => _ReportTeacherState();
}

class _ReportTeacherState extends State<ReportTeacher> {
  SessionService sessionService = SessionService();
  List<SessionReport> sessionReports = [];
  bool loading = true;

  void getData() async {
    await sessionService.getData();
    assignData();
  }

  void assignData() {
    loading = false;
    setState(() {
      sessionReports = sessionService.sessionReportList;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    DateFormat formatHourMinute = DateFormat('hh:mm');
    DateFormat formatDay = DateFormat('d MMMM');
    return loading
        ? const Center(
            child: SpinKitFadingCircle(
            color: KColors.blue,
            size: 50,
          ))
        : Scaffold(
            body: GridView.count(
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(width * 0.06),
            mainAxisSpacing: width * 0.05,
            crossAxisSpacing: width * 0.06,
            childAspectRatio: 1.25,
            children: [
              for (var i = 0; i < sessionReports.length; i++)
                InkWell(
                  onTap: () async {
                    await showAnimatedDialog(
                      context: context,
                      builder: (BuildContext context) {
                        print(sessionReports[i]);
                        return sessionReports[i].status == 'completo'
                            ? SessionReportDialog(sessionReports[i])
                            : CreateSessionReportDialog(sessionReports[i]);
                      },
                      animationType: DialogTransitionType.slideFromBottom,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                      barrierDismissible: true,
                    );
                    getData();
                  },
                  child: ReportCard(
                    status: sessionReports[i].status!,
                    date: formatDay
                        .format(stringToDatetime(sessionReports[i].classDate!)),
                    time: formatHourMinute.format(
                            stringToDatetime(sessionReports[i].classDate!)) +
                        '-' +
                        formatHourMinute.format(
                            stringToDatetime(sessionReports[i].classDate!).add(
                                Duration(hours: sessionReports[i].duration!))),
                  ),
                ),
              /*InkWell(
          onTap: () => showAnimatedDialog(
            context: context,
            builder: (BuildContext context) {
              return SessionReportDialog(report);
            },
            animationType: DialogTransitionType.slideFromBottom,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            barrierDismissible: true,
          ),
          child: const ReportCard(
            status: 'tarde',
            date: '1 Agosto',
            time: '09:00-10:00',
          ),
        ),*/
              /*InkWell(
          onTap: () => showAnimatedDialog(
            context: context,
            builder: (BuildContext context) {
              return CreateSessionReportDialog(report);
            },
            animationType: DialogTransitionType.slideFromBottom,
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            barrierDismissible: true,
          ),
          child: const ReportCard(
            status: 'pendiente',
            date: '6 Agosto',
            time: '13:00-15:00',
          ),
        ),*/
            ],
          ));
  }
}
