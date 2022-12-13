import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:globalinctasks/authscreens/loginscreens/models/userdatamodel.dart';
// import 'package:globalinctasks/constants/app_constants.dart';
// import 'package:globalinctasks/constants/sharedpreference.dart';
// import 'package:globalinctasks/homescreens/homescreen.dart';
import 'package:http/http.dart' as http;
// import 'package:globalinctasks/services/base_services.dart';

class LoginAuthController extends GetxController{

   // Rx<LoginModel> loginusermodel = LoginModel().obs;
   // RxBool isloading = true.obs;


  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  RxBool hidepassword = true.obs;


  void togglepasswordview() {
    hidepassword.value = !hidepassword.value;
  }


}