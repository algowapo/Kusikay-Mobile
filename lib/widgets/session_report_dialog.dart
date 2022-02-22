import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kusikay_mobile/models/session_report.dart';
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
  bool activeAssist1 = false;
  bool activeAssist2 = false;
  bool activeAssist3 = false;
  bool haveClass = true;
  var duration = TextEditingController();
  var textForm1 = TextEditingController();
  var textForm2 = TextEditingController();
  var textFormHaveClass = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration.text = "90";
    textForm1.text = widget.report.description; //ejemplo de get
    textForm2.text = widget.report.comments;
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
                                tappedCheck: classCheck,
                                tappedCross: classCross,
                              )
                            ],
                          )
                        : Text("boton suchi",
                            style: Theme.of(context).textTheme.caption)
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
                          fieldsEnabled
                              ? CheckButton(
                                  active: activeAssist1, tapped: classCheck)
                              : Text("boton suchi",
                                  style: Theme.of(context).textTheme.caption)
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
                          fieldsEnabled
                              ? CheckButton(
                                  active: activeAssist2, tapped: assist2)
                              : Text("boton suchi",
                                  style: Theme.of(context).textTheme.caption)
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
                          fieldsEnabled
                              ? CheckButton(
                                  active: activeAssist3, tapped: assist3)
                              : Text("boton suchi",
                                  style: Theme.of(context).textTheme.caption)
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
                        ? desInput(context, textForm1)
                        : Container()
                    : Text(widget.report.description,
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
                        ? desInput(context, textForm2)
                        : Container()
                    : Text(widget.report.comments,
                        style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                fieldsEnabled
                    ? haveClass
                        ? Text("Calificación de la clase",
                            style: Theme.of(context).textTheme.headline3)
                        : Container()
                    : Container(),
                fieldsEnabled
                    ? haveClass
                        ? Center(
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          )
                        : Container()
                    : Container(),
                fieldsEnabled
                    ? Container()
                    : Text("Duración de la clase",
                        style: Theme.of(context).textTheme.headline3),
                fieldsEnabled
                    ? Container()
                    : SizedBox(
                        height: 10,
                      ),
                fieldsEnabled
                    ? Container()
                    : Text("${widget.report.duration.toString()} minutos",
                        style: Theme.of(context).textTheme.bodyText1),
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
  const ReportDialogHeader({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SessionReportDialog widget;

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
              Text("1 agosto", style: Theme.of(context).textTheme.subtitle2)
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Text("Llenado por: Hector Suzuki",
              style: Theme.of(context).textTheme.caption),
          SizedBox(
            height: 2,
          ),
          Text("Fecha de llenado: ${widget.report.createdAt}",
              style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}
