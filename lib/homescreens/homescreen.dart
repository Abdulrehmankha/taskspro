import 'package:flutter/material.dart';
import 'package:globalinctasks/Utils/color_config.dart';
import 'package:globalinctasks/Utils/drawerscreen.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/homescreens/allposts.dart';
import 'package:globalinctasks/homescreens/profile.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  Responsive response = Responsive();
  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return DefaultTabController(
      child: Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          bottom: TabBar(
            labelColor: const Color(0xffffffff),
            labelStyle: TextStyle(
              fontSize: response.setTextScale(16),
              fontFamily: "Montserrat-Regular",
            ),
            indicatorWeight: 3,
            indicatorColor: const Color(0xffffffff),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color(0xffefefef),
            tabs: <Widget>[
              Tab(
                  text: 'ALL POSTS'
              ),
              Tab(
                  text: 'PROFILE',

              ),
            ],
          ),
          elevation: 2,
          centerTitle: false,
          backgroundColor: ColorConfig.primaryColor,
          title: Text(
            "Home Lorim",
            style: TextStyle(
                color: Colors.white, fontSize: response.setTextScale(16)),
          ),
          actions: [
            IconButton(onPressed: (){
              // Navigator.pop(context);
            },
                icon: Icon(Icons.search, size: 20, color: Color(0xffffffff),)
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            AllpostScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}
