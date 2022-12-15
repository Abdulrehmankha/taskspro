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


  // TransModel? transactionsModel;
  RxBool isloading = false.obs;
  RxString selectedIndexname = ''.obs;

  List<TransModel> myAllData = [];
  @override
  Future<void> onInit()async{
    super.onInit();
    getUsersTranactionData();
  }

  getUsersTranactionData() async {
    final url = Uri.parse('${AppConstants.urlBase}transactions');
    try {
      isloading.value = true;
      final response = await http
          .get(url, headers: {"Accept": "application/json"}).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200 || response.statusCode == 201) {

        String? responseBody = response.body;
        var jsonBody = json.decode(responseBody);

        myAllData.clear();

        for(var data in jsonBody){
          myAllData.add(TransModel(data['date'], data['amount'], data['type'], data['currencyCode'], data['iban'], data['description'], data['bic'], data['id']));
        }
        print('${myAllData[0].type}');
        isloading.value = false;

      }
    } catch (error) {
      if (error is TimeoutException) {
        print(error.message);
        print("error");
      }
      if (error is SocketException) {
        print(error.message);
        print("error socket");
      }
    }
  }


}