import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/pages/teacher/contacts_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/ranking_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/report_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/schedule_teacher.dart';
import 'package:kusikay_mobile/widgets/kusikay_appbar.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  static int _currentIndex = 0;

  final tabs = [
    ScheduleTeacher(),
    ReportTeacher(),
    ContactsTeacher(),
    RankingTeacher(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      appBar: KusikayAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        elevation: 10,
        selectedItemColor: KColors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Horario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review_outlined),
            label: 'Informes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts_outlined),
            label: 'Contactos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Ranking',
          ),
        ],
      ),
    );
  }
}
