import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';

Widget desInput(BuildContext context, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: KColors.green),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 2.0, 2.0),
      child: TextFormField(
          minLines: 1,
          maxLines: 10, // allow user to enter 5 line in textfield
          keyboardType: TextInputType
              .multiline, // user keyboard will have a button to move cursor to next line
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: Theme.of(context).textTheme.bodyText1),
    ),
  );
}
