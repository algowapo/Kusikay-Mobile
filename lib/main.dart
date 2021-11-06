import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kusikay_mobile/pages/teacher/home_teacher.dart';

void main() {
  //Ensures all the stuff is loaded TOP PRIORITY
  WidgetsFlutterBinding.ensureInitialized();

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
    print('$logicalWidth, $logicalHeight');

    return MaterialApp(
      title: 'Kusikay',
      theme: ThemeData(
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
        //TODO: Implement Theme
        fontFamily: 'Montserrat',
        iconTheme: IconThemeData(
          size: logicalWidth / 13,
          color: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeTeacher(),
      },
    );
  }
}
