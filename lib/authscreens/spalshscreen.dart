import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushNamed(context, '/login');

    });
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Center(
            child: Container(
              width: double.infinity,
              // Back Ground Image
              // constraints: const BoxConstraints.expand(),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage('assets/splasback.png'),
              //       fit: BoxFit.cover),
              // ),
              // width: double.infinity,
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
        ),
      ],
    );
  }
}
