import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/color_config.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transcontroller/transdataController.dart';

class TransactionsDetails extends StatelessWidget {
  // const TransactionsDetails({Key? key}) : super(key: key);
  Responsive response = Responsive();
  var groupdata = Get.arguments;

  AlltransactionController alltransdetails = Get.put(AlltransactionController());
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
            "Transaction Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConfig.textColor,
              fontSize: response.setTextScale(18),
            ),)
      ),
      body: SafeArea(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorConfig.textColor,
                border: Border.all(
                  color: ColorConfig.lightPink,
                  width: 1,
                  style: BorderStyle.solid
                )
              ),
              padding: const EdgeInsets.all(10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Particular Transaction Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorConfig.black,
                          fontSize: response.setTextScale(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 3 * MediaQuery.of(context).size.height / 100,
                  ),

                  // BIC
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].bic}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: ColorConfig.black,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),
                  // Transaction Date
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Date: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].date}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Transaction Time
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Time: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                            text: '${alltransdetails.myAllTransTime[groupdata!]}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Amount
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Amount: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Type
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Type: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].type}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Currency Code
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Currency Code: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].currencyCode}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Iban Number
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Iban Number: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: response.setTextScale(16),
                              color: const Color(0xff000000)),
                        ),
                        TextSpan(
                          //text: 'hehhfhg',
                            text: '${alltransdetails.myAllData[groupdata!].iban}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: response.setHeight(1),
                  ),

                  // Description
                  Text(
                    'Description: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: response.setTextScale(16),
                        color: const Color(0xff000000)),
                  ),
                  Text(
                    '${alltransdetails.myAllData[groupdata!].description}',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: response.setTextScale(14),
                              color: Colors.grey[700],
                            )
                  ),

                ],
              ),
            ),
          ),
        ],
    ),
      ),
    );
  }
}
