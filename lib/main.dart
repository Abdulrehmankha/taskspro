import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/authscreens/loginscreens/loginscreen.dart';
import 'package:globalinctasks/authscreens/spalshscreen.dart';
import 'package:globalinctasks/homescreens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Tasks',
      theme: ThemeData(
        primaryColor: Color(0xffE43228),
        secondaryHeaderColor: Color(0xffAF0917),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        //  "/": (context) => const AppIntro1Screen(),
        "/splash": (context) => const SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}

