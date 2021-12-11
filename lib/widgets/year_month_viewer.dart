import 'package:flutter/material.dart';

class YearMonthViewer extends StatelessWidget {
  final String year;
  final String month;
  const YearMonthViewer({Key? key, required this.year, required this.month})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.89,
      padding: EdgeInsets.symmetric(vertical: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2021',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Agosto',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
