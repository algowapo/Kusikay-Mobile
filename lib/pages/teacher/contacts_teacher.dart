import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';


class ContactsTeacher extends StatelessWidget {
  const ContactsTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    EdgeInsets listPadding =
    EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.06, width * 0.03);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Esta es la busqueda")
              ],
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: ListTile(
                      title: Text("Hector Suzuki"),
                      subtitle: Text("984234567"),
                      trailing: FaIcon(FontAwesomeIcons.whatsapp), onTap: (){print("Dirigir a whatsapp");},
                    ),
                  ),
                  const VerticalSeparator(),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: ListTile(
                      title: Text("Gino Quispe"),
                      subtitle: Text("9842334567"),
                      trailing: FaIcon(FontAwesomeIcons.whatsapp), onTap: (){print("Dirigir a whatsapp");},
                    ),
                  ),
                  const VerticalSeparator(),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: ListTile(
                      title: Text("Juan Hernandez"),
                      subtitle: Text("983235789"),
                      trailing: FaIcon(FontAwesomeIcons.whatsapp), onTap: (){print("Dirigir a whatsapp");},
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
