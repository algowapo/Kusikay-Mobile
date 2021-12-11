import 'package:flutter/material.dart';

class WeekSelector extends StatefulWidget {
  final List<String> dateStrings;
  const WeekSelector({Key? key, required this.dateStrings}) : super(key: key);

  @override
  State<WeekSelector> createState() => _WeekSelectorState();
}

class _WeekSelectorState extends State<WeekSelector> {
  List<String> get dateStrings => widget.dateStrings;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    TextStyle textStyle = Theme.of(context).textTheme.headline1!.copyWith(
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        );

    TextStyle selectedTextStyle = textStyle.copyWith(
      fontWeight: FontWeight.w500,
    );

    return Container(
      width: width * 0.89,
      padding: EdgeInsets.symmetric(vertical: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var date in dateStrings)
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = dateStrings.indexOf(date);
                });
              },
              child: Text(
                date,
                style: selected == dateStrings.indexOf(date)
                    ? selectedTextStyle
                    : textStyle,
              ),
            )
        ],
      ),
    );
  }
}
