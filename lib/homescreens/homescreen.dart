import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/color_config.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/Utils/routesscreens.dart';
import 'package:globalinctasks/homescreens/transactionscreens/views/transactionsscreen.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  Responsive response = Responsive();
  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return Scaffold(
      backgroundColor: ColorConfig.textColor,
      appBar:  AppBar(
          backgroundColor: ColorConfig.secondaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Color(0xff323232),
          ),

          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: response.setTextScale(22),
              color: ColorConfig.textColor,
            ),
          ),
          title: Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: ColorConfig.textColor,
            fontSize: response.setTextScale(18),
          ),)
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
              top: 15, right: 10, left: 10, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // health checkup

                      Container(
                        height: response.setHeight(23), //180
                        padding: const EdgeInsets.all(5),

                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionsScreen()));
                          },
                          child: Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: ColorConfig.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundColor:
                                      ColorConfig.textColor,
                                      child: Icon(
                                          Icons.money,
                                        size: response.setTextScale(24),
                                        color: ColorConfig.black,
                                      )
                                    ),
                                  ),
                                  SizedBox(
                                    height: response.setHeight(3),
                                  ),
                                  Text(
                                    'All Transactions',
                                    style: TextStyle(
                                      color: const Color(0xffffffff),
                                      fontSize: response.setTextScale(21),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
