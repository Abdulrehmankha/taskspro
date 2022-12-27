import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/constants/app_constants.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transcontroller/transdataController.dart';

class SearchBarController extends GetxController{
  TextEditingController searchcontrol = TextEditingController();

  RxBool issearch = false.obs;

  AlltransactionController alltransactionController = Get.put(AlltransactionController());

  List mysearching = [];

  SearchBarValue(context){
    issearch.value = true;
    var searchval = searchcontrol.text;
    for(int i = 0; i < alltransactionController.myAllData.length; i++){
      if(searchval.contains == alltransactionController.myAllData[i].type){
        mysearching.add(alltransactionController.myAllData);
        print(mysearching.toList());
      }else{
        print('error');
      }
    }

  }


}