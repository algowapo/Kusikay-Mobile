import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';

class CheckButton extends StatefulWidget {
  final bool active;
  final VoidCallback tapped;
  const CheckButton({Key? key, this.active = false, required this.tapped})
      : super(key: key);

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool get active => widget.active;
  VoidCallback get tapped => widget.tapped;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        tapped();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
                color: active ? KColors.green : Colors.white,
                border: Border.all(
                    color:
                        active ? Colors.white : KColors.green.withOpacity(0.5),
                    width: active ? 0 : width * 0.003),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.03)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(width * 0.005, width * 0.005),
                      blurRadius: width * 0.01),
                ]),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          Icon(
            Icons.check,
            size: width * 0.08,
            color: active ? Colors.white : KColors.green,
          ),
        ],
      ),
    );
  }
}
