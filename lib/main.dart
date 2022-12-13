import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/themedata.dart';
import 'package:globalinctasks/authscreens/loginscreens/loginscreen.dart';
import 'package:globalinctasks/authscreens/spalshscreen.dart';
import 'package:globalinctasks/homescreens/homescreen.dart';

import 'Utils/getroutes.dart';
import 'Utils/routesscreens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Tasks',
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoutes.initialRoute,
      getPages: GetAppRoute().getRoutes(),
    );
  }
}

