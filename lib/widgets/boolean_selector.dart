import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/check_button.dart';
import 'package:kusikay_mobile/widgets/cross_button.dart';

class BooleanSelector extends StatefulWidget {
  const BooleanSelector({Key? key}) : super(key: key);

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
    });
  }

  void tapCross() {
    setState(() {
      check = false;
      cross = true;
    });
  }
}
