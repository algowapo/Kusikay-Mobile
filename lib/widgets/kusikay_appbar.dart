import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';

PreferredSizeWidget KusikayAppBar(BuildContext context,
    {required VoidCallback onBenefitTap, required bool back}) {
  double width = MediaQuery.of(context).size.width;
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    toolbarHeight: width / 6,
    title: SizedBox(
      width: width / 4,
      child: Image.asset(
        'assets/logo-azul.png',
      ),
    ),
    titleSpacing: width / 18,
    leading: back
        ? null
        : new IconButton(
            icon: new Icon(Icons.arrow_back, color: KColors.blue),
            onPressed: () => Navigator.of(context).pop(),
          ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: width / 40),
        child: IconButton(
          icon: const Icon(
            Icons.card_giftcard,
            color: Colors.black,
          ),
          onPressed: () => onBenefitTap(),
        ),
      )
    ],
    bottom: PreferredSize(
      preferredSize: Size(width, 2),
      child: const VerticalSeparator(),
    ),
  );
}
