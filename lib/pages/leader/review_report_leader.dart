import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/models/teacher.dart';
import 'package:kusikay_mobile/services/teacher_service.dart';
import 'package:kusikay_mobile/widgets/vertical_separator.dart';

class ReviewReports extends StatefulWidget {
  const ReviewReports({Key? key}) : super(key: key);

  @override
  State<ReviewReports> createState() => _ReviewReportsState();
}

class _ReviewReportsState extends State<ReviewReports> {
  TeacherService teacherService = TeacherService();

  List<Teacher> teachers = [];

  void getData() async {
    teachers = await teacherService.getTeachersByLeaderId(1);
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
    bool alert = true;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: TRAER NOMBRE DEL CURSO AL LOGIN
            Text('Danza Folclorica',
                style: Theme.of(context).textTheme.headline1),
            Expanded(
              child: ListView.builder(
                itemCount: teachers.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return RevisarInformeTile(
                    alert: false,
                    name: teachers[index].name!,
                    phone: teachers[index].phone!,
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

class RevisarInformeTile extends StatelessWidget {
  const RevisarInformeTile(
      {Key? key, required this.alert, required this.name, required this.phone})
      : super(key: key);

  final bool alert;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
        trailing: alert == true
            ? const FaIcon(FontAwesomeIcons.bell,
                color: Colors.black87, size: 25)
            : null,
        onTap: () {
          //dirigir a vista de Calixtro
        },
      ),
    );
  }
}
