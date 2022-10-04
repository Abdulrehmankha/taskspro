import 'package:flutter/material.dart';
import 'package:globalinctasks/Utils/responsive.dart';

class AllpostScreen extends StatelessWidget {
  // const AllpostScreen({Key? key}) : super(key: key);
  
  Responsive response = Responsive();

  @override
  Widget build(BuildContext context) {
    response.setContext(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  SizedBox(
                    height: response.setHeight(1),
                  ),
                  Text(
                      'Lorem Ipsum Text Here Lorem Ipsum Text Here Lorem Ipsum Text Here Lorem Ipsum Text Here ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                    child: Divider(
                      color: Colors.grey,
                      height: 12,
                    ),
                  ),

                  SizedBox(
                    height: response.setHeight(2),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
