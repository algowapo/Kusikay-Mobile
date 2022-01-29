import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/widgets/create_session_report_dialog.dart';
import 'package:kusikay_mobile/widgets/report_card.dart';
import 'package:kusikay_mobile/widgets/report_card_leader.dart';
import 'package:kusikay_mobile/widgets/session_report_dialog.dart';

class ReviewReports extends StatefulWidget {
  const ReviewReports({Key? key}) : super(key: key);

  @override
  State<ReviewReports> createState() => _ReviewReportsState();
}

class _ReviewReportsState extends State<ReviewReports> {
  SessionReport report = SessionReport(
      1,
      "2000-12-12",
      "Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase Buena clase",
      "2021-12-12",
      "Es una buena clase porque no enseñó Sopla pucha mano lorem gaaaaaa si e porque no enseñó Sopla pucha mano lorem gaaaaaa si e porque no enseñó Sopla pucha mano lorem gaaaaaa si",
      90,
      true,
      "Hector",
      "Gino",
      "Juanca",
      "Porque no",
      1);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 10.0),
              child: Text(
                'Hector Suzuki',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'El artista está al día con sus informes',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'El artista tiene pendiente llenar 3 informes',
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
              child: GridView.count(
                crossAxisCount: 2,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(width * 0.06),
                mainAxisSpacing: width * 0.05,
                crossAxisSpacing: width * 0.06,
                childAspectRatio: 1.25,
                children: [
                  const ReportCardLeader(
                    status: 'tarde',
                    date: '1 Agosto',
                    time: '12:00-13:00',
                    students: ['Gino Quispe Calixto'],
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
              ),
            )
          ])),
    );
  }
}
