import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kusikay_mobile/models/session_report.dart';
import 'package:kusikay_mobile/widgets/description_input.dart';

class SessionReportDialog extends StatefulWidget {
  final SessionReport report;

  const SessionReportDialog(this.report);

  @override
  State<SessionReportDialog> createState() => _SessionReportDialogState();
}

class _SessionReportDialogState extends State<SessionReportDialog> {
  bool fieldsEnabled = false;
  var duration = TextEditingController();
  var textForm1 = TextEditingController();
  var textForm2 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration.text = "90";
    textForm1.text = widget.report.description; //ejemplo de get
    textForm2.text = widget.report.comments;
  }

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
                              Text("btn zuk 1",
                                  style: Theme.of(context).textTheme.caption),
                              SizedBox(
                                width: 5,
                              ),
                              Text("btn zuk 2",
                                  style: Theme.of(context).textTheme.caption)
                            ],
                          )
                        : Text("boton suchi",
                            style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Asistencia",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.report.student1,
                        style: Theme.of(context).textTheme.subtitle2),
                    fieldsEnabled
                        ? Text("btn tggl",
                            style: Theme.of(context).textTheme.caption)
                        : Text("boton suchi",
                            style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.report.student2,
                        style: Theme.of(context).textTheme.subtitle2),
                    fieldsEnabled
                        ? Text("btn tggl",
                            style: Theme.of(context).textTheme.caption)
                        : Text("boton suchi",
                            style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.report.student3,
                        style: Theme.of(context).textTheme.subtitle2),
                    fieldsEnabled
                        ? Text("btn tggl",
                            style: Theme.of(context).textTheme.caption)
                        : Text("boton suchi",
                            style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                fieldsEnabled
                    ? Text("¿Cúal fue la duración? (minutos)",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                fieldsEnabled
                    ? TextField(
                        controller: duration,
                        style: Theme.of(context).textTheme.caption,
                        decoration: InputDecoration(),
                      )
                    : Container(),
                fieldsEnabled
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                Text("Cuéntanos que hicieron",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                fieldsEnabled
                    ? desInput(context, textForm1)
                    : Text(widget.report.description,
                        style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                Text("Observaciones / Comentarios Adicionales",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                fieldsEnabled
                    ? desInput(context, textForm2)
                    : Text(widget.report.comments,
                        style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                fieldsEnabled
                    ? Text("Calificación de la clase",
                        style: Theme.of(context).textTheme.headline3)
                    : Container(),
                fieldsEnabled
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
