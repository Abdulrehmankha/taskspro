import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/color_config.dart';
import 'package:globalinctasks/Utils/responsive.dart';

//
class DrawerScreen extends StatelessWidget {
  Responsive response = Responsive();
  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return Drawer(
      elevation: 0,
      child: Container(
        margin: EdgeInsets.zero,
        color: const Color(0xffCCDCF9),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
           //   padding: EdgeInsets.zero,
              child:  UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color:ColorConfig.primaryColor,
                ),
                accountName:
                Text("David",  style: const TextStyle(fontSize: 20,color: Colors.black)),
                accountEmail: Text("davidbackhum123@yahoo.com",  style: const TextStyle(fontSize: 20,color: Colors.black)),
                margin: const EdgeInsets.only(bottom: 0),

              ),
            ),
            // home
            InkWell(
              onTap: () {
               // Navigator.pushNamed(context, '/home');
              },
              child: ListTile(

                title: Text(
                  "My Appointment History",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: response.setTextScale(16)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

