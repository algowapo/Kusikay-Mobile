import 'package:flutter/material.dart';
import 'package:kusikay_mobile/models/session_report.dart';

class SessionReportDialog extends StatefulWidget {
  final SessionReport report;

  const SessionReportDialog(this.report);

  @override
  State<SessionReportDialog> createState() => _SessionReportDialogState();
}

class _SessionReportDialogState extends State<SessionReportDialog> {
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
                    Text("boton suchi",
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
                    Text("boton suchi",
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
                    Text("boton suchi",
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
                    Text("boton suchi",
                        style: Theme.of(context).textTheme.caption)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Cuéntanos que hicieron",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                Text(widget.report.description,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                Text("Cuéntanos que hicieron",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                Text(widget.report.comments,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                Text("Duración de la clase",
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 10,
                ),
                Text("${widget.report.duration.toString()} minutos",
                    style: Theme.of(context).textTheme.bodyText1),
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
                Row(
                  children: [
                    Icon(Icons.edit, size: 20,),
                    SizedBox(width: 3,),
                    Text('Editar', style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
                Container(height: 50, child: VerticalDivider(color: Colors.black38)),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, size: 20,),
                      SizedBox(width: 3,),
                      Text('Salir', style: Theme.of(context).textTheme.subtitle1),
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
