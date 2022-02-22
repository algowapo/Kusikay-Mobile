import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/check_button.dart';
import 'package:kusikay_mobile/widgets/cross_button.dart';

class BooleanSelector extends StatefulWidget {
  final VoidCallback tappedCheck;
  final VoidCallback tappedCross;
  const BooleanSelector(
      {Key? key, required this.tappedCheck, required this.tappedCross})
      : super(key: key);

  @override
  _BooleanSelectorState createState() => _BooleanSelectorState();
}

class _BooleanSelectorState extends State<BooleanSelector> {
  bool check = false;
  bool cross = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        CheckButton(active: check, tapped: tapCheck),
        SizedBox(width: width * 0.035),
        CrossButton(active: cross, tapped: tapCross),
      ],
    );
  }

  void tapCheck() {
    setState(() {
      check = true;
      cross = false;
      widget.tappedCheck;
    });
  }

  void tapCross() {
    setState(() {
      check = false;
      cross = true;
      widget.tappedCross;
    });
  }
}
