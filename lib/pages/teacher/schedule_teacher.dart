import 'package:flutter/material.dart';

class ScheduleTeacher extends StatelessWidget {
  const ScheduleTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
    );
  }
}
