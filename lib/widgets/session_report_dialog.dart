import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/services/session_service.dart';
import 'package:kusikay_mobile/utils/util.dart';
import 'package:kusikay_mobile/widgets/boolean_selector.dart';
import 'package:kusikay_mobile/widgets/check_button.dart';
import 'package:kusikay_mobile/widgets/description_input.dart';

class SessionReportDialog extends StatefulWidget {
  final SessionReport report;
  const SessionReportDialog(this.report);

  @override
  State<SessionReportDialog> createState() => _SessionReportDialogState();
}

class _SessionReportDialogState extends State<SessionReportDialog> {
  bool fieldsEnabled = false;

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
        content: Text('Informe de sesión actualizado correctamente'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    } else {
      const snackBar = SnackBar(
        content: Text('Error al actualizar informe de sesión'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration.text = widget.report.duration == null
        ? ''
        : widget.report.duration!.toString();
    description.text = widget.report.description == null
        ? ''
        : widget.report.description!; //ejemplo de get
    commets.text =
        widget.report.comments == null ? '' : widget.report.comments!;
    student1.text =
        widget.report.student1 == null ? '' : widget.report.student1!;
    student2.text =
        widget.report.student2 == null ? '' : widget.report.student2!;
    student3.text =
        widget.report.student3 == null ? '' : widget.report.student3!;
    haveClass = widget.report.hadClass!;
    whyNotClass.text =
        widget.report.whyNotClass == null ? '' : widget.report.whyNotClass!;
  }

  void classCheck() {
    haveClass = true;
  }

  void classCross() {
    haveClass = false;
  }

  void toggleEditing() {
    setState(() {
      fieldsEnabled = !fieldsEnabled;
    });
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
                    Text("¿ Tuvo Clase?",
                        style: Theme.of(context).textTheme.headline3),
                    fieldsEnabled
                        ? Row(
                            children: [
                              BooleanSelector(
                                tappedCheck: () => {},
                                tappedCross: () => {},
                                activo: report.hadClass,
                              )
                            ],
                          )
                        : BooleanSelector(
                            tappedCheck: () => {},
                            tappedCross: () => {},
                            activo: report.hadClass,
                          )
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
                haveClass
                    ? Container()
                    : Text(whyNotClass.text,
                        style: Theme.of(context).textTheme.subtitle2),
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
                          Text(widget.report.student1!,
                              style: Theme.of(context).textTheme.subtitle2),
                          fieldsEnabled
                              ? CheckButton(
                                  active: report.assistanceStudent1,
                                  tapped: assist1)
                              : CheckButton(
                                  active: report.assistanceStudent1,
                                  tapped: () => {})
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
                          Text(widget.report.student2!,
                              style: Theme.of(context).textTheme.subtitle2),
                          fieldsEnabled
                              ? CheckButton(
                                  active: report.assistanceStudent2,
                                  tapped: assist2)
                              : CheckButton(
                                  active: report.assistanceStudent2,
                                  tapped: () => {})
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
                          Text(widget.report.student3!,
                              style: Theme.of(context).textTheme.subtitle2),
                          fieldsEnabled
                              ? CheckButton(
                                  active: report.assistanceStudent3,
                                  tapped: assist3)
                              : CheckButton(
                                  active: report.assistanceStudent3,
                                  tapped: () => {})
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                fieldsEnabled
                    ? haveClass
                        ? Text("¿Cúal fue la duración? (minutos)",
                            style: Theme.of(context).textTheme.headline3)
                        : Container()
                    : Container(),
                fieldsEnabled
                    ? haveClass
                        ? TextField(
                            controller: duration,
                            style: Theme.of(context).textTheme.caption,
                            decoration: InputDecoration(),
                          )
                        : Container()
                    : Container(),
                fieldsEnabled
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                haveClass
                    ? Text("Cuéntanos que hicieron",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                fieldsEnabled
                    ? haveClass
                        ? desInput(context, description)
                        : Container()
                    : Text(widget.report.description!,
                        style: Theme.of(context).textTheme.bodyText1),
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
                fieldsEnabled
                    ? haveClass
                        ? desInput(context, commets)
                        : Container()
                    : Text(widget.report.comments!,
                        style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                fieldsEnabled
                    ? Container()
                    : haveClass
                        ? Text("Duración de la clase",
                            style: Theme.of(context).textTheme.headline3)
                        : Container(),
                fieldsEnabled
                    ? Container()
                    : SizedBox(
                        height: 10,
                      ),
                fieldsEnabled
                    ? Container()
                    : haveClass
                        ? Text("${widget.report.duration.toString()} minutos",
                            style: Theme.of(context).textTheme.bodyText1)
                        : Container(),
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
                fieldsEnabled
                    ? InkWell(
                        onTap: () {
                          toggleEditing();
                          print("Se descarto");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline,
                              size: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text('Descartar',
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
                            if (widget.report.hadClass == false) {
                              () => {};
                              const snackBar = SnackBar(
                                content:
                                    Text('Este informe no se puede editar'),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.of(context).pop();
                            } else {
                              toggleEditing();
                              print('se puede editar');
                            }
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
                          updateSessionReport();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.save_sharp,
                              size: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text('Guardar',
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

class ReportDialogHeader extends StatelessWidget {
  ReportDialogHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SessionReportDialog widget;

  final DateFormat formatDayMonth = DateFormat('dd MMMM');
  final DateFormat formatDate = DateFormat('dd/MM/yyyy hh:mm');

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
              Text(
                  formatDayMonth
                      .format(stringToDatetime(widget.report.classDate!)),
                  style: Theme.of(context).textTheme.subtitle2)
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text(
              "Fecha de llenado: ${formatDate.format(stringToDatetime(widget.report.createdAt!))}",
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}
