import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:globalinctasks/constants/app_constants.dart';
import 'package:globalinctasks/homescreens/transactionscreens/transmodel/transdatamodel.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AlltransactionController extends GetxController{

  RxBool isloading = false.obs;
  late DateTime dt;
  var formattedDate;
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
          myAllData.add
            (
              TransModel(
                  data['date'],
                  data['amount'],
                  data['type'],
                  data['currencyCode'],
                  data['iban'],
                  data['description'],
                  data['bic'],
                  data['id']
              ));
        }
        for(int i = 0; i < myAllData.length; i++){
          dt = DateTime.parse('${myAllData[i].date}');
          formattedDate = DateFormat('dd-MM-yyyy').format(dt);
          myAllData[i].date = formattedDate;
        }
        myAllData.sort((a, b) => b.date.compareTo(a.date));
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