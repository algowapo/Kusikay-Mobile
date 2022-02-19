import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/widgets/cross_button.dart';

class CreateMeetingDialog extends StatefulWidget {
  CreateMeetingDialog({Key? key}) : super(key: key);

  @override
  State<CreateMeetingDialog> createState() => _CreateMeetingDialogState();
}

class _CreateMeetingDialogState extends State<CreateMeetingDialog> {
  var meetingName = TextEditingController();
  var meetingDescription = TextEditingController();
  DateTime? _dateTime;
  DateFormat formatDate = DateFormat('dd/MM/yyyy');
  TimeOfDay? _time;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                'Crear Reunion',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Nombre de la reunion',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    TextField(
                      controller: meetingName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Fecha',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2222))
                            .then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue[100]),
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _dateTime == null
                                    ? 'Elige una fecha'
                                    : formatDate.format(_dateTime!),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hora',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((hour) {
                          setState(() {
                            _time = hour;
                          });
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue[100]),
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _time == null
                                    ? 'Elige la hora'
                                    : _time!.format(context),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Descripción',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    TextField(
                      controller: meetingDescription,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: Colors.grey.shade400),
                ),
                color: Colors.white,
              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      print("llamar a servicio");
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text('Crear Reunión',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
