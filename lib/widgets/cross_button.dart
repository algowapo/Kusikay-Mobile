import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';

class CrossButton extends StatefulWidget {
  final bool checked;
  const CrossButton({Key? key, required this.checked}) : super(key: key);

  @override
  _CrossButtonState createState() => _CrossButtonState();
}

class _CrossButtonState extends State<CrossButton> {
  bool get checked => widget.checked;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width * 0.1,
          height: width * 0.1,
          decoration: BoxDecoration(
              color: checked ? KColors.red : Colors.white,
              border: Border.all(
                  color: checked ? Colors.white : KColors.red.withOpacity(0.5),
                  width: checked ? 0 : width * 0.003),
              borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(width * 0.005, width * 0.005),
                    blurRadius: width * 0.01),
              ]),
        ),
        Icon(
          Icons.close,
          size: width * 0.08,
          color: checked ? Colors.white : KColors.red,
        ),
      ],
    );
  }
}
