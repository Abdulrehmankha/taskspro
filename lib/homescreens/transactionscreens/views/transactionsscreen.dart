import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/responsive.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transcontroller/transdataController.dart';
import '../../../Utils/color_config.dart';

class TransactionsScreen extends StatefulWidget {
  // const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    // TODO: implement initState

    alltransactionController.getUsersTranactionData(context);
    super.initState();
  }

  Responsive response = Responsive();
  AlltransactionController alltransactionController = Get.put(AlltransactionController());

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                //var changestatus =  cm_attended_controller.compatttktdata.value.items![index].tktstsid;
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
                                                  'Date: ${alltransactionController.transactionsModel!.date!}',
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
                                            backgroundColor: const Color(0xff088296),
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
                                              'Iban : PL61037295780360030002103092',
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

                                    // Amount
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                              'Amount : ',
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
                                                "Deposit",
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
                                                "xbd",
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
      ),
        )

    );
  }
}
