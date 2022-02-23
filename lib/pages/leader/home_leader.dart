import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/pages/leader/leader_teachers_review.dart';
import 'package:kusikay_mobile/pages/leader/schedule_leader.dart';
import 'package:kusikay_mobile/pages/teacher/contacts_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/ranking_teacher.dart';
import 'package:kusikay_mobile/pages/teacher/report_teacher.dart';
import 'package:kusikay_mobile/widgets/benefits_tab.dart';
import 'package:kusikay_mobile/widgets/create_meeting_dialog.dart';
import 'package:kusikay_mobile/widgets/kusikay_appbar.dart';

class HomeLeader extends StatefulWidget {
  const HomeLeader({Key? key}) : super(key: key);

  @override
  _HomeLeaderState createState() => _HomeLeaderState();
}

class _HomeLeaderState extends State<HomeLeader> {
  static int _currentIndex = 0;
  static bool _showingBenefits = false;

  final tabs = [
    ScheduleLeader(),
    ReportTeacher(),
    ReviewReports(),
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
          BenefitsTab(
            showingBenefits: _showingBenefits,
            onDismiss: _benefitsTabDismissed,
          ),
        ],
      ),
      appBar:
          KusikayAppBar(context, onBenefitTap: _benefitsTabTapped, back: true),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () async {
                await showAnimatedDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CreateMeetingDialog();
                  },
                  animationType: DialogTransitionType.slideFromBottom,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 500),
                  barrierDismissible: true,
                );
                setState(() {});
              },
              label: const Text(
                'Crear Reunion',
                style: TextStyle(color: Colors.white),
              ),
              icon: const FaIcon(
                FontAwesomeIcons.calendarPlus,
                color: Colors.white,
                size: 20,
              ),
            )
          : null,
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
            label: 'Mis Informes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Revisar Informes',
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
