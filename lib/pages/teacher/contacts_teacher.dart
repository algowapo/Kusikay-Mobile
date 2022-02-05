import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/models/course.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'package:kusikay_mobile/services/course_service.dart';
import 'package:kusikay_mobile/services/teacher_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsTeacher extends StatefulWidget {
  const ContactsTeacher({Key? key}) : super(key: key);

  @override
  State<ContactsTeacher> createState() => _ContactsTeacherState();
}

class _ContactsTeacherState extends State<ContactsTeacher> {
  CourseService courseService = CourseService();
  TeacherService teacherService = TeacherService();

  List<Course> courses = [];
  List<Teacher> teachers = [];

  void getData() async {
    courses = await courseService.getCourses();
    teachers = await teacherService.getTeachers();
    setState(() {});
  }

  void sendMessage(Teacher teacher) async {
    String url = "https://wa.me/${teacher.phone}/?text=${Uri.parse('Hola!')}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // can't launch url, there is some error
      throw "No se pudo enviar el mensaje";
    }

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
              child: ListView.builder(
                itemCount: teachers.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ListTile(
                      title: Text(teachers[index].name!),
                      subtitle: Text(teachers[index].phone!),
                      trailing: const FaIcon(FontAwesomeIcons.whatsapp,
                          color: Colors.black87, size: 25),
                      onTap: () {
                        sendMessage(teachers[index]);
                      },
                    ),
                  );
                },
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
