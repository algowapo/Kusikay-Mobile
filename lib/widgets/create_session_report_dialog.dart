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
  bool activeHaveClass1 = false;
  bool activeHaveClass2 = true;
  bool activeAssist1 = false;
  bool activeAssist2 = false;
  bool activeAssist3 = false;
  var duration = TextEditingController();
  var textForm1 = TextEditingController();
  var textForm2 = TextEditingController();
  var textFormHaveClass = TextEditingController();

  SessionService sessionService = SessionService();

  SessionReport get report => widget.report;

  void updateSessionReport() {
    SessionReport completeSessionReport = SessionReport(
      report.id,
      report.classDate,
      textForm2.text,
      report.createdAt,
      textForm1.text,
      int.parse(duration.text),
      haveClass,
      report.student1,
      report.student2,
      report.student3,
      textFormHaveClass.text,
      report.teacherId,
      "completo",
    );
    sessionService.sessionReport = completeSessionReport;
    sessionService.updateData();
  }

  void classCheck() {
    haveClass = true;
  }

  void classCross() {
    haveClass = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration.text = "90";
    textForm1.text = widget.report.description; //ejemplo de get
    textForm2.text = widget.report.comments;
  }

  void toggleHaveClass1() {
    setState(() {
      haveClass = !haveClass;
      activeHaveClass1 = !activeHaveClass1;
    });
  }

  void toggleHaveClass2() {
    setState(() {
      haveClass = !haveClass;
      activeHaveClass2 = !activeHaveClass2;
    });
  }

  void assist1() {
    setState(() {
      activeAssist1 = !activeAssist1;
    });
  }

  void assist2() {
    setState(() {
      activeAssist2 = !activeAssist2;
    });
  }

  void assist3() {
    setState(() {
      activeAssist3 = !activeAssist3;
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
                      tappedCheck: classCheck,
                      tappedCross: classCross,
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
                haveClass ? Container() : desInput(context, textFormHaveClass),
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
                          Text(widget.report.student1,
                              style: Theme.of(context).textTheme.subtitle2),
                          CheckButton(active: activeAssist1, tapped: assist1)
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
                          Text(widget.report.student2,
                              style: Theme.of(context).textTheme.subtitle2),
                          CheckButton(active: activeAssist2, tapped: assist2)
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
                          Text(widget.report.student3,
                              style: Theme.of(context).textTheme.subtitle2),
                          CheckButton(active: activeAssist3, tapped: assist3)
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
                haveClass ? desInput(context, textForm1) : Container(),
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
                haveClass ? desInput(context, textForm2) : Container(),
                SizedBox(
                  height: 20,
                ),
                haveClass
                    ? Text("Calificación de la clase",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                haveClass
                    ? Center(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      )
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
                InkWell(
                  onTap: () {
                    updateSessionReport();
                    Navigator.of(context).pop();
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
              Text(formatDay.format(stringToDatetime(widget.report.classDate)),
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
