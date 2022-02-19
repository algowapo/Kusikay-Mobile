import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kusikay_mobile/colors/kusikay_colors.dart';
import 'package:kusikay_mobile/pages/leader/home_leader.dart';
import 'package:kusikay_mobile/pages/teacher/home_teacher.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kusikay_mobile/pages/teacher/login.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //Ensures all the stuff is loaded TOP PRIORITY
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('es_ES', null);

  Intl.defaultLocale = 'es';
  setPathUrlStrategy();

  runApp(const KusikayApp());
}

class KusikayApp extends StatelessWidget {
  const KusikayApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pixelRatio = window.devicePixelRatio;
    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalWidth = logicalScreenSize.width;
    var logicalHeight = logicalScreenSize.height;
    //print('$logicalWidth, $logicalHeight');

    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
      title: 'Kusikay',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: KColors.blue,
              onSecondary: KColors.blue,
            ),
        appBarTheme: const AppBarTheme(color: Colors.white),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: logicalWidth / 20, // 360 / 18
            fontWeight: FontWeight.w600, // Semi-bold
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: logicalWidth / 20, // 360 / 18
            fontWeight: FontWeight.w500, // Medium
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: logicalWidth / 23, // 360 / 16
            fontWeight: FontWeight.w500, // Medium
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: logicalWidth / 23, // 360 / 16
            fontWeight: FontWeight.w600, // Semi-bold
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: logicalWidth / 23, // 360 / 16
            fontWeight: FontWeight.w500, // Medium
            color: Colors.black,
          ),
          subtitle2: TextStyle(
            fontSize: logicalWidth / 23, // 360 / 16
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: logicalWidth / 26, // 360 / 14
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: logicalWidth / 30, // 360 / 12
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black,
          ),
          caption: TextStyle(
            fontSize: logicalWidth / 30, // 360 / 12
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black54,
          ),
          overline: TextStyle(
            fontSize: logicalWidth / 36, // 360 / 10
            fontWeight: FontWeight.w500, // Medium
            color: Colors.white,
          ),
        ),
        fontFamily: 'Montserrat',
        iconTheme: IconThemeData(
          size: logicalWidth / 13,
          color: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/leader',
      routes: {
        '/': (context) => const Login(),
        '/leader': (context) => const HomeLeader(),
        '/home': (context) => const HomeTeacher()
      },
    );
  }
}
