import 'package:flutter/material.dart';
import 'package:kusikay_mobile/models/teacher_schedule.dart';
import 'package:kusikay_mobile/services/teacher_service.dart';
import 'package:kusikay_mobile/utils/util.dart';
import 'package:kusikay_mobile/widgets/schedule_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:kusikay_mobile/widgets/week_selector.dart';
import 'package:kusikay_mobile/widgets/year_month_viewer.dart';
import 'package:intl/intl.dart';

class ScheduleTeacher extends StatefulWidget {
  const ScheduleTeacher({Key? key}) : super(key: key);

  @override
  State<ScheduleTeacher> createState() => _ScheduleTeacherState();
}

class _ScheduleTeacherState extends State<ScheduleTeacher> {
  TeacherService teacherService = TeacherService();
  List<TeacherSchedule> teacherSchedule = [];
  DateTime today = DateTime.now();

  void getData() async {
    teacherSchedule = await teacherService.getTeacherSchedule();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            YearMonthViewer(
              year: today.year.toString(),
              month: months[today.month - 1],
            ),
            const VerticalSeparator(),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: teacherSchedule.length,
                itemBuilder: (context, index) {
                  var schedule = teacherSchedule[index];
                  DateFormat formatHourMinute = DateFormat('hh:mm');
                  DateFormat formatDay = DateFormat('dd MMMM');
                  var startHour = schedule.meetingId != null
                      ? formatHourMinute.format(schedule.meetingStartTime!)
                      : formatHourMinute.format(schedule.classStartTime!);
                  var finishHour = schedule.meetingId != null
                      ? formatHourMinute.format(schedule.meetingFinishTime!)
                      : formatHourMinute.format(schedule.classFinishTime!);

                  return Padding(
                    padding: EdgeInsets.all(width * 0.06),
                    child: ScheduleCard(
                        date: schedule.meetingId != null
                            ? formatDay.format(schedule.meetingStartTime!)
                            : schedule.classWeekDay!.toString(),
                        time: '$startHour - $finishHour',
                        title: schedule.meetingId == null
                            ? 'Clase de ${schedule.classCourseName}'
                            : '${schedule.meetingName}',
                        icon: schedule.meetingId != null
                            ? const Icon(Icons.groups_outlined)
                            : const Icon(Icons.school_outlined),
                        description: schedule.meetingId != null
                            ? '${schedule.meetingDescription}'
                            : 'Clase de la semana'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
