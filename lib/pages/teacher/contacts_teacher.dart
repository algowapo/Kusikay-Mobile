import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
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
  bool loading = true;

  List<Course> courses = [];
  List<Teacher> teachers = [];

  void getData() async {
    loading = true;
    courses = await courseService.getCourses();
    teachers = await teacherService.getTeachers();
    setState(() {});
    loading = false;
  }

  void filterByCourseId(int courseId) async {
    teachers = await teacherService.getTeachersByCourseId(courseId);
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
      body: loading
          ? const Center(
              child: SpinKitFadingCircle(
              color: KColors.orange,
              size: 50,
            ))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 60,
                      width: width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 2),
                                width: 300,
                                height: 50,
                                child: DropdownSearch<Course>(
                                  dropdownSearchDecoration:
                                      const InputDecoration(
                                    hintText: 'Curso',
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 12, 0, 0),
                                  ),
                                  mode: Mode.MENU,
                                  items: courses,
                                  itemAsString: (c) => c!.name!,
                                  onChanged: (value) {
                                    filterByCourseId(value!.id!);
                                  },
                                )),
                          ]),
                    ),
                  ),
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
