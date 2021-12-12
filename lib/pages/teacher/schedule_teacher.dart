import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/schedule_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:kusikay_mobile/widgets/week_selector.dart';
import 'package:kusikay_mobile/widgets/year_month_viewer.dart';

class ScheduleTeacher extends StatelessWidget {
  const ScheduleTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    EdgeInsets listPadding =
        EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.06, width * 0.03);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const YearMonthViewer(
              year: '2021',
              month: 'Agosto',
            ),
            const VerticalSeparator(),
            const WeekSelector(
              dateStrings: ['2-8', '9-15', '16-22', '23-29', '30-5'],
            ),
            const VerticalSeparator(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.06),
                    child: const ScheduleCard(
                        date: '3 Agosto',
                        time: '09:00-10:00',
                        title: 'Reunion Mensual',
                        icon: Icon(Icons.groups_outlined),
                        description:
                            'Se coordinarán detalles sobre el mes. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
                  ),
                  Padding(
                    padding: listPadding,
                    child: const ScheduleCard(
                        date: '4 Agosto',
                        time: '12:00-01:00',
                        title: 'Clase de Artes Libres',
                        icon: Icon(Icons.school_outlined),
                        description:
                            'Se coordinarán detalles sobre el mes. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
                  ),
                  Padding(
                    padding: listPadding,
                    child: const ScheduleCard(
                        date: '4 Agosto',
                        time: '12:00-01:00',
                        title: 'Clase de Artes Libres',
                        icon: Icon(Icons.school_outlined),
                        description:
                            'Se coordinarán detalles sobre el mes. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
                  ),
                  Padding(
                    padding: listPadding,
                    child: const ScheduleCard(
                        date: '4 Agosto',
                        time: '12:00-01:00',
                        title: 'Clase de Artes Libres',
                        icon: Icon(Icons.school_outlined),
                        description:
                            'Se coordinarán detalles sobre el mes. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
