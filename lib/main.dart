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
        //TODO: Implement Theme
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeTeacher(),
      },
    );
  }
}
