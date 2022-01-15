import 'package:flutter/material.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/widgets/cross_button.dart';

class AttendanceDialog extends StatefulWidget {
  const AttendanceDialog({Key? key}) : super(key: key);

  @override
  _AttendanceDialogState createState() => _AttendanceDialogState();
}

class _AttendanceDialogState extends State<AttendanceDialog> {

  bool fieldsEnabled = true;
  var duration = TextEditingController();
  var textForm1 = TextEditingController();
  var textForm2 = TextEditingController();



  final teachers = [
    "Hector Suzuki",
    "Gino Quispe",
    "Juan Hernandez",
    "Valeria Duarte"
  ];

  void toggleEditing() {
    setState(() {
      fieldsEnabled = !fieldsEnabled;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssistanceDialogHeader(),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                    itemCount: teachers.length,
                      itemBuilder: (context, index) {
                        return TeacherTile(teacher: teachers[index],);
                      }
                  ),
                )
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
                  fieldsEnabled
                      ? InkWell(
                    onTap: () {
                      toggleEditing();
                      print("Se descarto");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Cancelar',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  )
                      : InkWell(
                    onTap: () {
                      if (fieldsEnabled) {
                        toggleEditing();
                        print("no se puede editar");
                      } else {
                        toggleEditing();
                        print('se puede editar');
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Editar',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                  Container(
                      height: 50, child: VerticalDivider(color: Colors.black38)),
                  fieldsEnabled
                      ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      print("Se actualizo");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Registrar',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  )
                      : InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 20,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('Salir',
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
      ),
    );
  }
}


class AssistanceDialogHeader extends StatelessWidget {
  const AssistanceDialogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Asistencia",
              style: Theme.of(context).textTheme.headline1),

          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("09:00-10:00",
                  style: Theme.of(context).textTheme.headline2),
              Text("3/8", style: Theme.of(context).textTheme.headline2)
            ],
          ),
        ],
      ),
    );
  }
}

class TeacherTile extends StatefulWidget {

  final String teacher;
  const TeacherTile({Key? key, required this.teacher}) : super(key: key);

  @override
  State<TeacherTile> createState() => _TeacherTileState();
}

class _TeacherTileState extends State<TeacherTile> {

  bool activo = false;

  void toggleActivate() {
    setState(() {
      activo = !activo;
    });
    print('hola');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.teacher, style: Theme.of(context).textTheme.headline2),
          Row(
            children: [
              Icon(Icons.lightbulb_outline_rounded, size: 30,),
              SizedBox(width: 10,),
              Icon(Icons.thumb_up_alt_outlined, size: 30),
              SizedBox(width: 10,),
              CrossButton(tapped: toggleActivate, active: activo,)

            ],
          )
        ],
      ),
    );
  }
}

