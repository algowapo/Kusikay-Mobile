import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  final double bottomPadding;
  const VerticalSeparator({Key? key, this.bottomPadding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width / 1.07,
          child: const Divider(
            height: 2,
            thickness: 1,
            color: Colors.black26,
          ),
        ),
        SizedBox(
          height: bottomPadding,
        ),
      ],
    );
  }
}
