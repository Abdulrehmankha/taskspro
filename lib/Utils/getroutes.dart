import 'package:get/get.dart';
import 'package:globalinctasks/Utils/routesscreens.dart';
import 'package:globalinctasks/authscreens/loginscreens/loginscreen.dart';
import 'package:globalinctasks/homescreens/homescreen.dart';

import '../authscreens/spalshscreen.dart';


class GetAppRoute{
  List<GetPage> getRoutes(){
    return [
      GetPage(
          name: MyRoutes.initialRoute,
          page: () => SplashScreen(),
          // page: () => HomeScreenPage(),
      ),
      GetPage(
        name: MyRoutes.loginRoute,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: MyRoutes.homeRoute,
        page: () => HomeScreen(),
      ),


    ];
  }
}