import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/teacher_schedule.dart';
import 'package:kusikay_mobile/services/teacher_service.dart';
import 'package:kusikay_mobile/utils/util.dart';
import 'package:kusikay_mobile/widgets/attendance_dialog.dart';
import 'package:kusikay_mobile/widgets/schedule_card.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:kusikay_mobile/widgets/year_month_viewer.dart';

class ScheduleLeader extends StatefulWidget {
  const ScheduleLeader({Key? key}) : super(key: key);

  @override
  State<ScheduleLeader> createState() => _ScheduleLeaderState();
}

class _ScheduleLeaderState extends State<ScheduleLeader> {
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
      body: teacherSchedule.isEmpty
          ? const Center(
              child: SpinKitFadingCircle(
              color: KColors.yellow,
              size: 50,
            ))
          : Center(
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
                            ? formatHourMinute
                                .format(schedule.meetingStartTime!)
                            : formatHourMinute.format(schedule.classStartTime!);
                        var finishHour = schedule.meetingId != null
                            ? formatHourMinute
                                .format(schedule.meetingFinishTime!)
                            : formatHourMinute
                                .format(schedule.classFinishTime!);

                        return Padding(
                            padding: EdgeInsets.all(width * 0.06),
                            child: InkWell(
                              onTap: () async {
                                if (schedule.meetingId != null &&
                                    schedule.finished == false) {
                                  await showAnimatedDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AttendanceDialog(
                                        meeting: schedule,
                                        editable: true,
                                      );
                                    },
                                    animationType:
                                        DialogTransitionType.slideFromBottom,
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(milliseconds: 500),
                                    barrierDismissible: true,
                                  );
                                  setState(() {
                                    getData();
                                  });
                                } else if (schedule.meetingId != null &&
                                    schedule.finished == true) {
                                  await showAnimatedDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AttendanceDialog(
                                        meeting: schedule,
                                        editable: false,
                                      );
                                    },
                                    animationType:
                                        DialogTransitionType.slideFromBottom,
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(milliseconds: 500),
                                    barrierDismissible: true,
                                  );
                                }
                              },
                              child: ScheduleCard(
                                  date: schedule.meetingId != null
                                      ? formatDay
                                          .format(schedule.meetingStartTime!)
                                      : schedule.classWeekDay!.toString(),
                                  time: '$startHour - $finishHour',
                                  title: schedule.meetingId == null
                                      ? 'Clase de ${schedule.classCourseName}'
                                      : (schedule.finished == true)
                                          ? '${schedule.meetingName} (FINALIZADO)'
                                          : '${schedule.meetingName}',
                                  icon: schedule.meetingId != null
                                      ? const Icon(Icons.groups_outlined)
                                      : const Icon(Icons.school_outlined),
                                  description: schedule.meetingId != null
                                      ? '${schedule.meetingDescription}'
                                      : 'Clase de la semana'),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
