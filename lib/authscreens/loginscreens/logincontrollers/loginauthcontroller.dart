import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/authscreens/loginscreens/models/userdatamodel.dart';
import 'package:globalinctasks/constants/app_constants.dart';
import 'package:globalinctasks/constants/sharedpreference.dart';
import 'package:globalinctasks/homescreens/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:globalinctasks/services/base_services.dart';

class LoginAuthController extends GetxController{

   Rx<UserDetailModel> loginusermodel = UserDetailModel.fromJson({}).obs;


  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  RxBool hidepassword = true.obs;

  BaseService baseService = BaseService();

  void togglepasswordview() {
    hidepassword.value = !hidepassword.value;
  }

  logInUserEmail(context) async {
    AppConstants.showLoaderDialog(context);
    // var body = {
    //   "email": '$email',
    //   "password": '$username',
    // };
    var data;
    final url = Uri.parse('${AppConstants.urlBase}login');
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    try {
      final response = await http.post(url, headers: userHeader, body: json.encode).timeout(const Duration(seconds: 10));
      if(response.statusCode==200 || response.statusCode==201){
        data = jsonDecode(response.body);
        Preferences().setUserData(data['success']['token']);
        Navigator.of(context).pop();
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) =>  HomeScreen(),
          ),(route) => false,//if you want to disable back feature set to false
        );
      }else{
        data = jsonDecode(response.body);
        Navigator.of(context).pop();
        AppConstants.showmessage(context,data['error']);
      }
    } catch (error) {
      Navigator.of(context).pop();
      if(error is TimeoutException){
        AppConstants.showinternetDialog(context);
      }
      if(error is SocketException){
        AppConstants.showinternetDialog(context);
      }
    }
  }

  // getUserData(context) async {
  //   EasyLoading.show(status: 'Pleas Wait...');
  //   // var apiResponse = await http
  //   //     .get(Uri.http("108.61.2.133:8080", "ords/hobm/user_engineers"));
  //   debugPrint("call1");
  //   var data = await baseService.baseGetAPI("users");
  //   debugPrint("call2");
  //   if(data!=null){
  //     // var jsonData = data;
  //
  //     debugPrint("hello admin");
  //     // var mydata = jsonData["items"];
  //
  //
  //     bool check = false;
  //
  //       if (emailcontroller.text == ['email'] &&
  //           passwordcontroller.text == ['username']) {
  //
  //         debugPrint("heelo");
  //
  //         check = true;
  //         //
  //         EasyLoading.showSuccess('Login Sucess');
  //
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) => HomeScreen()));
  //       }
  //       //  else {
  //
  //       //
  //       // }
  //     EasyLoading.dismiss();
  //     if (check == false) {
  //       edgeAlert(context,
  //           title: 'Warning!',
  //           description: 'Login Failed',
  //           backgroundColor: Colors.red,
  //           gravity: Gravity.top);
  //       EasyLoading.showError('Sorry Login Failed!');
  //     }
  //     else {
  //       edgeAlert(context,
  //           title: 'Success',
  //           description: 'Login Successfully',
  //           backgroundColor: Colors.green,
  //           gravity: Gravity.top);
  //       EasyLoading.showSuccess('Login Sucess');
  //     }
  //   }
  // }



}