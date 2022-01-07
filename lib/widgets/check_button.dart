import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';

class CheckButton extends StatefulWidget {
  final bool checked;
  const CheckButton({Key? key, required this.checked}) : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
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
              color: checked ? KColors.green : Colors.white,
              border: Border.all(
                  color: checked ? Colors.white : KColors.green.withOpacity(0.5),
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
          Icons.check,
          size: width * 0.08,
          color: checked ? Colors.white : KColors.green,
        ),
      ],
    );
  }
}
