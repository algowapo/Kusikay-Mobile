import 'package:flutter/material.dart';
import 'package:kusikay_mobile/widgets/base_card.dart';

class ScheduleCard extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final Icon icon;
  final String description;
  final bool leader;
  const ScheduleCard(
      {Key? key,
      required this.date,
      required this.time,
      required this.title,
      required this.icon,
      required this.description,
      this.leader = false})
      : super(key: key);

  Widget spacer() {
    return const SizedBox(
      height: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                time,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
          spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
              icon,
            ],
          ),
          spacer(),
          Text(
            description,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
