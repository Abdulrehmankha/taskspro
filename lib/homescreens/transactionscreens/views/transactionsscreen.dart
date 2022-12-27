import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/Utils/routesscreens.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transcontroller/transdataController.dart';
import 'package:globalinctasks/services/searchmodel.dart';
import '../../../Utils/color_config.dart';
import 'package:intl/intl.dart';


class TransactionsScreen extends StatefulWidget {
  // const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {

  @override
  void initState(){
    super.initState();
    alltransactionController.getUsersTranactionData();
  }

  Responsive response = Responsive();
  AlltransactionController alltransactionController = Get.put(AlltransactionController());
  SearchBarController searchBarController = Get.put(SearchBarController());

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
            "Transactions",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConfig.textColor,
              fontSize: response.setTextScale(18),
            ),)
      ),
      body:
        SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: response.setTextScale(13),
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorConfig.primaryColor),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorConfig.primaryColor),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: response.setTextScale(11),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    controller: searchBarController.searchcontrol,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      if (value != '') {
                        searchBarController.SearchBarValue(context);
                      } else {
                        searchBarController.issearch.value = false;
                      }
                    },
                    validator: (var value) {
                      if (value!.isEmpty) {
                        return 'Please Enter any word to search';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Obx(
                    () => searchBarController.issearch.value == true ?

                    SizedBox(
                      height: response.setHeight(75),
                      child: Obx(
                              ()=> searchBarController.mysearching.isEmpty ?
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: ColorConfig.secondaryColor,
                                    ),
                                  ) :
                              ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: alltransactionController.myAllData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SafeArea(
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                                      color: ColorConfig.textColor,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[


                                          Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: ColorConfig.primaryColor,
                                                  width: 1
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: InkWell(
                                              onTap: (){
                                                Get.toNamed(MyRoutes.AlltransactionDetailRoute, arguments: index);
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[

                                                  //customer

                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height: response.setHeight(7),
                                                        width: double.infinity,
                                                        color: ColorConfig.primaryColor,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                      'Date: ${searchBarController.mysearching[index].date}',
                                                                      style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize:
                                                                        response.setTextScale(15),
                                                                        color: ColorConfig.textColor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // const Spacer(),
                                                              SizedBox(
                                                                width: response.setWidth(10),
                                                              ),
                                                              CircleAvatar(
                                                                radius: 11,
                                                                backgroundColor: ColorConfig.secondaryColor,
                                                                child: Text('${index+1}', style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize:
                                                                    response.setTextScale(12),
                                                                    color: const Color(0xffffffff))),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ListTile(
                                                    title: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[

                                                        // Iban Number
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 10, bottom: 5),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                  'Iban : ${searchBarController.mysearching[index].iban}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      fontSize: response
                                                                          .setTextScale(14),
                                                                      color: const Color(
                                                                          0xff2e2e2e)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        // Time
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 10, bottom: 5),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  //${alltransactionController.transactionsModel?.success![index].amount}
                                                                  text:
                                                                  'Time : ${alltransactionController.myAllTransTime[index]}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.normal,
                                                                      fontSize: response
                                                                          .setTextScale(14),
                                                                      color: const Color(
                                                                          0xff2e2e2e)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        // Amount
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 10, bottom: 5),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  //${alltransactionController.transactionsModel?.success![index].amount}
                                                                  text:
                                                                  'Amount : ${searchBarController.mysearching[index].amount}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.normal,
                                                                      fontSize: response
                                                                          .setTextScale(14),
                                                                      color: const Color(
                                                                          0xff2e2e2e)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        // transaction type

                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'Type: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.normal,
                                                                      fontSize: response
                                                                          .setTextScale(12),
                                                                      color: const Color(
                                                                          0xff000000)),
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                    "${searchBarController.mysearching[index].type} ",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.normal,
                                                                        fontSize: response
                                                                            .setTextScale(12),
                                                                        color: Colors
                                                                            .grey[700])),
                                                              ],
                                                            ),
                                                          ),
                                                        ),


                                                        // Currency code
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            top: 5,
                                                            bottom: 5,
                                                          ),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'currency code: ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.normal,
                                                                      fontSize: response
                                                                          .setTextScale(12),
                                                                      color: const Color(
                                                                          0xff000000)),
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                    "${searchBarController.mysearching[index].currencyCode}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.normal,
                                                                        fontSize: response
                                                                            .setTextScale(12),
                                                                        color: Colors
                                                                            .grey[700])),
                                                              ],
                                                            ),
                                                          ),
                                                        ),



                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                      ),
                    ) :

                    SizedBox(
                      height: response.setHeight(75),
                      child: Obx(
                              ()=> alltransactionController.myAllData.isEmpty ?
                          Center(
                            child: CircularProgressIndicator(
                              color: ColorConfig.secondaryColor,
                            ),
                          ) :
                          ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: alltransactionController.myAllData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SafeArea(
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                                  color: ColorConfig.textColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[


                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: ColorConfig.primaryColor,
                                              width: 1
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: (){
                                            Get.toNamed(MyRoutes.AlltransactionDetailRoute, arguments: index);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[

                                              //customer

                                              Stack(
                                                children: [
                                                  Container(
                                                    height: response.setHeight(7),
                                                    width: double.infinity,
                                                    color: ColorConfig.primaryColor,
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                  'Date: ${alltransactionController.myAllData[index].date}',
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize:
                                                                    response.setTextScale(15),
                                                                    color: ColorConfig.textColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // const Spacer(),
                                                          SizedBox(
                                                            width: response.setWidth(10),
                                                          ),
                                                          CircleAvatar(
                                                            radius: 11,
                                                            backgroundColor: ColorConfig.secondaryColor,
                                                            child: Text('${index+1}', style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:
                                                                response.setTextScale(12),
                                                                color: const Color(0xffffffff))),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ListTile(
                                                title: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: <Widget>[

                                                    // Iban Number
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10, bottom: 5),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                              'Iban : ${alltransactionController.myAllData[index].iban}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  fontSize: response
                                                                      .setTextScale(14),
                                                                  color: const Color(
                                                                      0xff2e2e2e)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // Time
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10, bottom: 5),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              //${alltransactionController.transactionsModel?.success![index].amount}
                                                              text:
                                                              'Time : ${alltransactionController.myAllTransTime[index]}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.normal,
                                                                  fontSize: response
                                                                      .setTextScale(14),
                                                                  color: const Color(
                                                                      0xff2e2e2e)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // Amount
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 10, bottom: 5),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              //${alltransactionController.transactionsModel?.success![index].amount}
                                                              text:
                                                              'Amount : ${alltransactionController.myAllData[index].amount}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.normal,
                                                                  fontSize: response
                                                                      .setTextScale(14),
                                                                  color: const Color(
                                                                      0xff2e2e2e)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    // transaction type

                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                      ),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Type: ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.normal,
                                                                  fontSize: response
                                                                      .setTextScale(12),
                                                                  color: const Color(
                                                                      0xff000000)),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                "${alltransactionController.myAllData[index].type} ",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    fontSize: response
                                                                        .setTextScale(12),
                                                                    color: Colors
                                                                        .grey[700])),
                                                          ],
                                                        ),
                                                      ),
                                                    ),


                                                    // Currency code
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                      ),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'currency code: ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.normal,
                                                                  fontSize: response
                                                                      .setTextScale(12),
                                                                  color: const Color(
                                                                      0xff000000)),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                "${alltransactionController.myAllData[index].currencyCode}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    fontSize: response
                                                                        .setTextScale(12),
                                                                    color: Colors
                                                                        .grey[700])),
                                                          ],
                                                        ),
                                                      ),
                                                    ),



                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                      ),
                    )
              ),
            ],
          ),
        ),

    );
  }
}
