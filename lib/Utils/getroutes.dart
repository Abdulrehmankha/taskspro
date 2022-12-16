import 'package:get/get.dart';
import 'package:globalinctasks/Utils/routesscreens.dart';
import 'package:globalinctasks/authscreens/loginscreens/loginscreen.dart';
import 'package:globalinctasks/homescreens/homescreen.dart';
import 'package:globalinctasks/homescreens/transactionscreens/views/transactiondetails.dart';
import 'package:globalinctasks/homescreens/transactionscreens/views/transactionsscreen.dart';

import '../authscreens/spalshscreen.dart';


class GetAppRoute{
  List<GetPage> getRoutes(){
    return [
      GetPage(
          name: MyRoutes.initialRoute,
          page: () => SplashScreen(),
      ),
      GetPage(
        name: MyRoutes.loginRoute,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: MyRoutes.homeRoute,
        page: () => HomeScreen(),
      ),

      GetPage(
        name: MyRoutes.transactionScreenRoute,
        page: () => TransactionsScreen(),
      ),

      GetPage(
        name: MyRoutes.AlltransactionDetailRoute,
        page: () => TransactionsDetails(),
      ),

    ];
  }
}