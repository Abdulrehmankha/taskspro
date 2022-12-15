import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/routesscreens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Get.toNamed(MyRoutes.loginRoute);
    });
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/logo.jpeg",
                  height: 250,
                  width: 250,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
