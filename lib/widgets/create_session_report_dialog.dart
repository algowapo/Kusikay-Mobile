import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/services/session_service.dart';
import 'package:kusikay_mobile/utils/util.dart';
import 'package:kusikay_mobile/widgets/boolean_selector.dart';
import 'package:kusikay_mobile/widgets/check_button.dart';
import 'package:kusikay_mobile/widgets/description_input.dart';

class CreateSessionReportDialog extends StatefulWidget {
  final SessionReport report;
  const CreateSessionReportDialog(this.report);

  @override
  _CreateSessionReportDialogState createState() =>
      _CreateSessionReportDialogState();
}

class _CreateSessionReportDialogState extends State<CreateSessionReportDialog> {
  bool haveClass = true;
  var duration = TextEditingController();
  var student1 = TextEditingController();
  var student2 = TextEditingController();
  var student3 = TextEditingController();
  var description = TextEditingController();
  var commets = TextEditingController();
  var whyNotClass = TextEditingController();

  SessionService sessionService = SessionService();

  SessionReport get report => widget.report;

  void updateSessionReport() async {
    SessionReport completeSessionReport = SessionReport(
      report.id,
      report.classDate,
      commets.text,
      report.createdAt,
      description.text,
      int.parse(duration.text),
      haveClass,
      student1.text,
      student2.text,
      student3.text,
      report.assistanceStudent1,
      report.assistanceStudent2,
      report.assistanceStudent3,
      whyNotClass.text,
      report.teacherId,
      "completo",
    );
    completeSessionReport.createdAt = DateTime.now().toString();
    completeSessionReport.assistanceStudent1 = report.assistanceStudent1;
    completeSessionReport.assistanceStudent2 = report.assistanceStudent2;
    completeSessionReport.assistanceStudent3 = report.assistanceStudent3;

    sessionService.sessionReport = completeSessionReport;
    bool response = await sessionService.updateData();
    if (response == true) {
      const snackBar = SnackBar(
        content: Text('Informe de sesión creado correctamente'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    } else {
      const snackBar = SnackBar(
        content: Text('Error al crear informe de sesión'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void classCheck() {
    setState(() {
      haveClass = true;
    });
    print(haveClass);
  }

  void classCross() {
    setState(() {
      haveClass = false;
    });
    print(haveClass);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration.text = "90";
    report.hadClass = true;
    description.text = widget.report.description == null
        ? ''
        : widget.report.description!; //ejemplo de get
    commets.text =
        widget.report.comments == null ? '' : widget.report.comments!;
    student1.text = "";
    student2.text = "";
    student3.text = "";
  }

  void assist1() {
    setState(() {
      report.assistanceStudent1 = !report.assistanceStudent1;
    });
  }

  void assist2() {
    setState(() {
      report.assistanceStudent2 = !report.assistanceStudent2;
    });
  }

  void assist3() {
    setState(() {
      report.assistanceStudent3 = !report.assistanceStudent3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportDialogHeader(widget: widget),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("¿Tuvo Clase?",
                        style: Theme.of(context).textTheme.headline3),
                    BooleanSelector(
                      tappedCheck: () => classCheck(),
                      tappedCross: () => classCross(),
                      activo: report.hadClass,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                haveClass
                    ? Container()
                    : Text("Cuentanos por qué no tuvieron clases",
                        style: Theme.of(context).textTheme.headline3),
                haveClass
                    ? Container()
                    : SizedBox(
                        height: 20,
                      ),
                haveClass ? Container() : desInput(context, whyNotClass),
                haveClass
                    ? Container()
                    : SizedBox(
                        height: 20,
                      ),
                haveClass
                    ? Text("Asistencia",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                haveClass
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            child: TextField(
                              controller: student1,
                              style: Theme.of(context).textTheme.caption,
                              decoration: InputDecoration(),
                            ),
                          ),
                          CheckButton(
                              active: report.assistanceStudent1,
                              tapped: assist1)
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 13,
                ),
                haveClass
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            child: TextField(
                              controller: student2,
                              style: Theme.of(context).textTheme.caption,
                              decoration: InputDecoration(),
                            ),
                          ),
                          CheckButton(
                              active: report.assistanceStudent2,
                              tapped: assist2)
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 13,
                ),
                haveClass
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.6,
                            child: TextField(
                              controller: student3,
                              style: Theme.of(context).textTheme.caption,
                              decoration: InputDecoration(),
                            ),
                          ),
                          CheckButton(
                              active: report.assistanceStudent3,
                              tapped: assist3)
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                haveClass
                    ? Text("¿Cúal fue la duración? (minutos)",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                haveClass
                    ? TextField(
                        controller: duration,
                        style: Theme.of(context).textTheme.caption,
                        decoration: InputDecoration(),
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                haveClass
                    ? Text("Cuéntanos que hicieron",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                haveClass ? desInput(context, description) : Container(),
                SizedBox(
                  height: 20,
                ),
                haveClass
                    ? Text("Observaciones / Comentarios Adicionales",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                haveClass ? desInput(context, commets) : Container(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    updateSessionReport();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline_outlined,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('Crear Informe',
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

class ReportDialogHeader extends StatelessWidget {
  ReportDialogHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CreateSessionReportDialog widget;
  final DateFormat formatDay = DateFormat('d MMMM');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Informe de Sesion",
                  style: Theme.of(context).textTheme.headline1),
              Text(formatDay.format(stringToDatetime(widget.report.classDate!)),
                  style: Theme.of(context).textTheme.subtitle2)
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text(
              "¡Hola! Gracias por ser parte de este proyecto. Sin ti esto no sería posible.",
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}
