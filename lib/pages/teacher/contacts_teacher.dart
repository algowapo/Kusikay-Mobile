import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ContactsTeacher extends StatelessWidget {
  const ContactsTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBarContacts(width: width),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      title: const Text("Hector Suzuki"),
                      subtitle: const Text("984234567"),
                      trailing: const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.black87, size: 25),
                      onTap: () {
                        //print("Dirigir a whatsapp");
                      },
                    ),
                  ),
                  const VerticalSeparator(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      title: const Text("Gino Quispe"),
                      subtitle: const Text("9842334567"),
                      trailing: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.black87,
                        size: 25,
                      ),
                      onTap: () {
                        //print("Dirigir a whatsapp");
                      },
                    ),
                  ),
                  const VerticalSeparator(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      title: const Text("Juan Hernandez"),
                      subtitle: const Text("983235789"),
                      trailing: const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.black87, size: 25),
                      onTap: () {
                        //print("Dirigir a whatsapp");
                      },
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

class SearchBarContacts extends StatelessWidget {
  const SearchBarContacts({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
              width: 140,
              child: DropdownSearch(
                  mode: Mode.MENU,
                  items: ["Danza", "Artes", "Musica", 'Dibujo'],
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Danza"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(3, 5))
                  ]),
                  child: const TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0)
                        ),
                        hintText: 'Buscar'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
