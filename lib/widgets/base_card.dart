import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Color color;
  const BaseCard({Key? key, required this.child, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.89,
      padding: EdgeInsets.all(width * 0.05),
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(width * 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(4, 4),
          )
        ],
      ),
    );
  }
}
