import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/report_card.dart';

class ReportTeacher extends StatelessWidget {
  const ReportTeacher({Key? key}) : super(key: key);

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
      children: const [
        ReportCard(
          status: 'tarde',
          date: '1 Agosto',
          time: '09:00-10:00',
        ),
        ReportCard(
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
