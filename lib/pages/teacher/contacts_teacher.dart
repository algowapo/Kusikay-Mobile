import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/models/course.dart';
import 'package:kusikay_mobile/services/course_service.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ContactsTeacher extends StatefulWidget {
  const ContactsTeacher({Key? key}) : super(key: key);

  @override
  State<ContactsTeacher> createState() => _ContactsTeacherState();
}

class _ContactsTeacherState extends State<ContactsTeacher> {
  CourseService courseService = CourseService();
  List<Course> courses = [];

  void getData() async {
    courses = await courseService.getCourses();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBarContacts(width: width, courses: courses),
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
  const SearchBarContacts(
      {Key? key, required this.width, required this.courses})
      : super(key: key);

  final double width;
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        width: width,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              width: 300,
              height: 50,
              child: DropdownSearch<Course>(
                mode: Mode.MENU,
                items: courses,
                itemAsString: (c) => c!.name!,
                onChanged: (value) {
                  print(value);
                },
                selectedItem: courses[0],
              )),
        ]),
      ),
    );
  }
}

Widget _customDropDownExample(BuildContext context, Course? item) {
  if (item == null) {
    return Container();
  }

  return ListTile(
    contentPadding: EdgeInsets.all(0),
    title: Text(item.name!),
  );
}
