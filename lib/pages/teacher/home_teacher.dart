import 'package:flutter/material.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/pages/teacher/contacts_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/ranking_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/report_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/schedule_teacher.dart';
import 'package:kusikay_mobile/widgets/benefits_tab.dart';
import 'package:kusikay_mobile/widgets/kusikay_appbar.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  static int _currentIndex = 0;
  static bool _showingBenefits = false;

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

  void _benefitsTabTapped() {
    setState(() {
      _showingBenefits = !_showingBenefits;
    });
  }

  void _benefitsTabDismissed() {
    setState(() {
      _showingBenefits = false;
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
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          tabs[_currentIndex],
          GestureDetector(
            onTap: _benefitsTabDismissed,
            child: AnimatedOpacity(
              opacity: _showingBenefits ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
              opacity: _showingBenefits ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: BenefitsTab()),
        ],
      ),
      appBar: KusikayAppBar(context, onBenefitTap: _benefitsTabTapped),
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
