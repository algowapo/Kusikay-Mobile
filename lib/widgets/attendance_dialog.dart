import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/models/assistance.dart';
import 'package:kusikay_mobile/models/teacher_schedule.dart';
import 'package:kusikay_mobile/services/assistance_service.dart';
import 'package:kusikay_mobile/services/teacher_service.dart';
import 'package:kusikay_mobile/widgets/cross_button.dart';

class AttendanceDialog extends StatefulWidget {
  final TeacherSchedule meeting;
  final bool? editable;

  AttendanceDialog({Key? key, required this.meeting, this.editable})
      : super(key: key);

  @override
  _AttendanceDialogState createState() => _AttendanceDialogState();
}

class _AttendanceDialogState extends State<AttendanceDialog> {
  List<Assistance> teacherAssistance = [];
  TeacherService teacherService = TeacherService();
  AssistanceService assistanceService = AssistanceService();
  DateFormat formatHourMinute = DateFormat('hh:mm');
  DateFormat formatDate = DateFormat('dd/MM');

  void toggleActivate(index) {
    setState(() {
      teacherAssistance[index].assistance =
          !teacherAssistance[index].assistance!;
    });
  }

  void getData() async {
    teacherAssistance = widget.editable! == true
        ? await teacherService.getTeachersByMeetingId(widget.meeting.meetingId!)
        : await assistanceService.getAssistance(widget.meeting.meetingId!);

    setState(() {});
  }

  void createAssistance() async {
    bool response = await assistanceService.createAssistance(
        teacherAssistance, widget.meeting.meetingId!);

    if (response) {
      const snackBar = SnackBar(
        content: Text('Asistencia guardada correctamente'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    } else {
      const snackBar = SnackBar(
        content: Text('Error'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return teacherAssistance.length != 0
        ? Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AssistanceDialogHeader(
                    hora:
                        '${formatHourMinute.format(widget.meeting.meetingStartTime!)} - ${formatHourMinute.format(widget.meeting.meetingFinishTime!)}',
                    fecha: formatDate.format(widget.meeting.meetingStartTime!)),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: teacherAssistance.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(teacherAssistance[index].teacherName!,
                                  style: Theme.of(context).textTheme.headline2),
                              Row(
                                children: [
                                  CrossButton(
                                    tapped: () => widget.editable! == true
                                        ? toggleActivate(index)
                                        : null,
                                    active:
                                        teacherAssistance[index].assistance!,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                )),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2.0, color: Colors.grey.shade400),
                    ),
                    color: Colors.white,
                  ),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: widget.editable!
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: [
                      widget.editable!
                          ? InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                print("Se cancelo");
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.cancel_outlined,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text('Cancelar',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            )
                          : Container(
                              color: Colors.red,
                            ),
                      widget.editable!
                          ? const SizedBox(
                              height: 50,
                              child: VerticalDivider(color: Colors.black38))
                          : Container(
                              color: Colors.black38,
                            ),
                      widget.editable!
                          ? InkWell(
                              onTap: () {
                                createAssistance();
                                //Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text('Registrar',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text('Salir',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ],
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
          )
        : const Center(
            child: SpinKitFadingCircle(
            color: KColors.purple,
            size: 50,
          ));
  }
}

class AssistanceDialogHeader extends StatelessWidget {
  final String hora;
  final String fecha;
  const AssistanceDialogHeader(
      {Key? key, required this.hora, required this.fecha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Asistencia", style: Theme.of(context).textTheme.headline1),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hora, style: Theme.of(context).textTheme.headline2),
              Text(fecha, style: Theme.of(context).textTheme.headline2)
            ],
          ),
        ],
      ),
    );
  }
}
