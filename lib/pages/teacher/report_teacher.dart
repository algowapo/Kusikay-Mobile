import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/widgets/report_card.dart';
import 'package:kusikay_mobile/widgets/session_report_dialog.dart';

class ReportTeacher extends StatefulWidget {
  const ReportTeacher({Key? key}) : super(key: key);

  @override
  State<ReportTeacher> createState() => _ReportTeacherState();
}

class _ReportTeacherState extends State<ReportTeacher> {
  SessionReport report = SessionReport(1, "2000-12-12", "Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase", "2021-12-12", "Es una buena clase porque no enseñó Sopla pucha mano lorem gaaaaaa si e porque no enseñó Sopla pucha mano lorem gaaaaaa si e porque no enseñó Sopla pucha mano lorem gaaaaaa si", 90, true, "Hector", "Gino", "Juanca", "Porque no", 1);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(width * 0.06),
      mainAxisSpacing: width * 0.05,
      crossAxisSpacing: width * 0.06,
      childAspectRatio: 1.25,
      children: [
        InkWell(
          onTap: ()=>showAnimatedDialog(
              context: context,
              builder: (BuildContext context){
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
        ),
        const ReportCard(
          status: 'tarde',
          date: '1 Agosto',
          time: '12:00-13:00',
        ),
        ReportCard(
          status: 'pendiente',
          date: '6 Agosto',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'pendiente',
          date: '6 Agosto',
          time: '19:00-20:00',
        ),
        ReportCard(
          status: 'completo',
          date: '30 Julio',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'completo',
          date: '28 Julio',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'completo',
          date: '28 Julio',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'completo',
          date: '28 Julio',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'completo',
          date: '28 Julio',
          time: '13:00-15:00',
        ),
        ReportCard(
          status: 'completo',
          date: '28 Julio',
          time: '13:00-15:00',
        ),
      ],
    ));
  }
}
