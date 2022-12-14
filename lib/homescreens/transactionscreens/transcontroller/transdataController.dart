import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/constants/app_constants.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transmodel/transdatamodel.dart';
import 'package:http/http.dart' as http;

class AlltransactionController extends GetxController{

 TransactionsModel? transactionsModel;
  RxBool isloading = true.obs;
  RxList Alldata = [].obs;
  getUsersTranactionData(context) async {
    // AppConstants.showLoaderDialog(context);
    isloading.value = true;
    var data;
    final url = Uri.parse('${AppConstants.urlBase}transactions');

    try {
      final response = await http
          .get(url)
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200 || response.statusCode == 201) {
        data = jsonDecode(response.body);
        if(data != null){
          debugPrint('Data Agaya.......');
          transactionsModel = TransactionsModel.fromJson(data);
          isloading.value = false;
        }

      }
    } catch (error) {
      if (error is TimeoutException) {
        isloading.value = false;
        AppConstants.hideloading();
        //AppConstants.showinternetDialog(context);
      }
      if (error is SocketException) {
        isloading.value = false;
        AppConstants.hideloading();
        //AppConstants.showinternetDialog(context);
      }
    }
  }


}