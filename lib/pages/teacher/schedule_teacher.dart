import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/schedule_card.dart';

class ScheduleTeacher extends StatelessWidget {
  const ScheduleTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.caption,
            ),
            Container(
              color: Colors.black,
              child: Text(
                'Schedule',
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            const ScheduleCard(
                leader: true,
                date: '3 Agosto',
                time: '09:00-10:00',
                title: 'Reunion Mensual',
                icon: Icon(Icons.groups_outlined),
                description:
                    'Se coordinarán detalles sobre el mes. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.')
          ],
        ),
      ),
    );
  }
}
