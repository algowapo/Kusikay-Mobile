import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';

class ReviewReports extends StatelessWidget {
  const ReviewReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool alert = true;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Danza Folclorica', style: Theme.of(context).textTheme.headline1),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  RevisarInformeTile(alert: alert),
                  const VerticalSeparator(),
                  const RevisarInformeTile(alert: false),
                  const VerticalSeparator(),
                  RevisarInformeTile(alert: alert),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RevisarInformeTile extends StatelessWidget {
  const RevisarInformeTile({
    Key? key,
    required this.alert,
  }) : super(key: key);

  final bool alert;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ListTile(
        title: const Text("Hector Suzuki"),
        subtitle: const Text("984234567"),
        trailing: alert == true ? const FaIcon(FontAwesomeIcons.bell, color: Colors.black87, size: 25) : null,
        onTap: () {
          //dirigir a vista de Calixtro
        },
      ),
    );
  }
}
