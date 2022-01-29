import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/widgets/base_card.dart';

class ReportCardLeader extends StatelessWidget {
  final String status;
  final String date;
  final String time;
  final List<String> students;
  const ReportCardLeader(
      {Key? key,
      required this.status,
      required this.date,
      required this.time,
      required this.students})
      : super(key: key);

  Color colorStatus(String status) {
    String statusLw = status.toLowerCase();
    if (statusLw == 'tarde') return KColors.red;
    if (statusLw == 'pendiente') return KColors.amber;
    if (statusLw == 'completo') return KColors.green;
    return KColors.blue;
  }

  Icon iconStatus(String status) {
    String statusLw = status.toLowerCase();
    if (statusLw == 'tarde') return const Icon(Icons.assignment_late_outlined);
    if (statusLw == 'pendiente') return const Icon(Icons.watch_later_outlined);
    if (statusLw == 'completo') return const Icon(Icons.verified_outlined);
    return const Icon(Icons.error_outline_outlined);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BaseCard(
      widthProportion: 0.42,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.2,
                height: width * 0.045,
                child: Center(
                  child: Container(
                    child: Text(
                      status,
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(letterSpacing: 0.5),
                    ),
                    transform: Matrix4.translationValues(0, -1, 0),
                  ),
                ),
                decoration: BoxDecoration(
                    color: colorStatus(status),
                    borderRadius:
                        BorderRadius.all(Radius.circular(width * 0.03))),
              ),
              iconStatus(status),
            ],
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 6),
          Text(
            time,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
