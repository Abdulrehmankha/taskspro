import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/themedata.dart';
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

