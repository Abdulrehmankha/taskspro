import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:hobmapp/services/MultipartRequest.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';


class BaseService {
  bool internetDialog=false;
  late String baseURL = "https://jsonplaceholder.typicode.com";
  // late String baseURL = "https://22f5-2400-adc1-125-f500-9407-8bcc-4c70-2154.ngrok.io/api";
  String? token;

  // static NavigationService _navigationService = locator<NavigationService>();


  Future baseDeleteAPI(url, body, context, {successMsg, loading}) async {
    if (loading == true && loading != null) {
      print('Please wait...');
    }

    String bearerAuth = 'Bearer $token';

    http.Response response;

    try {
      response = await http.delete(Uri.parse(baseURL + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': bearerAuth
          },
          body: jsonEncode(body));


      // EasyLoading.dismiss();

      var jsonData;
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        if (successMsg != null) {
          // CustomToast().showToast("Message", successMsg, false);
        }
        return jsonData;
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        jsonData = json.decode(response.body);
        // CustomToast().showToast("Error",jsonData["message"], true);
        // return {};
        return jsonData;
      } else if (response.statusCode == 401) {
        jsonData = json.decode(response.body);

        return {};
      } else {
        throw Exception('Failed');
      }
    } catch (SocketException) {
      print(SocketException);
      // EasyLoading.dismiss();
      return null;
    }
  }
  Future baseGetAPI(url,
      {successMsg, loading, status,utfDecoded,bool return404=false,bool errorToast=true,bool direct=false}) async {
    // EasyLoading.instance.userInteractions=false;
    if (loading == true && loading != null) {
      // EasyLoading.show(status: 'Please wait...');
    }



    http.Response response;
    try {
      response = await http.get(
        Uri.parse(baseURL + url),

      );
      // _logRequestOnAlice(response);
      log(response.body);
     if(loading==true){
       // EasyLoading.dismiss();
     }
      if(direct==true){
        return response.body;
      }

      if (status != null) {
        return response.statusCode;
      }

      var jsonData;
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        if(utfDecoded==true)
          {
            jsonData = json.decode(utf8.decode(response.bodyBytes));

            return jsonData;
          }
        jsonData = json.decode(response.body);
        if (successMsg != null) {
          // CustomToast().showToast("",successMsg, false);
        }
        return jsonData;
      }
      else if (response.statusCode == 401) {
        jsonData = json.decode(response.body);

      // Here TOken Exipre
        return null;
      }
      else {
        jsonData = json.decode(response.body);

      }
    } catch (SocketException) {
      //EasyLoading.dismiss();
      AlertDialog(
        content: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 20,
                ),
                SizedBox(height: 10),
             Text("There seems to be your network problem or a server side issue. Please try again or report the bug to the manager."),
                SizedBox(height: 20),
              ],
            )),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                // color: terColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: new Text("ok"),
                ),
                // color: secondaryColor,
                onPressed: () {
                 Get.back();
                },
              ),
            ],
          ),
        ],
      );
      return null;
    }
  }

  Future basePostAPI(url, body, context,
      {successMsg, loading}) async {
    //EasyLoading.instance.userInteractions=false;

    if (loading == true && loading != null) {
      //EasyLoading.show(status: 'Please wait...');
    }

    String bearerAuth =
        'Basic $token';

    http.Response response;

    try {
      response = await http.post(Uri.parse(baseURL + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': bearerAuth
          },
          body: jsonEncode(body));

      // _logRequestOnAlice(response);
      if(loading==true){
        //EasyLoading.dismiss();
      }

      var jsonData;
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        if (successMsg != null) {

        }
        return jsonData;
      } else if (response.statusCode == 400) {
        jsonData = json.decode(response.body);

        return jsonData;
      } else if (response.statusCode == 401) {
        jsonData = json.decode(response.body);

        return {};
      }else if (response.statusCode == 409) {
        jsonData = json.decode(response.body);

        return jsonData;
      }else if (response.statusCode == 404) {
        jsonData = json.decode(response.body);

        return jsonData;
      }else if (response.statusCode == 500) {
        jsonData = json.decode(response.body);

        return jsonData;
      }  else {
          print(response.statusCode);
          print(response.body);
        throw Exception('Failed');
      }
    } catch (SocketException) {
      print(SocketException);
      //EasyLoading.dismiss();
      return null;
    }
  }
  Future basePutAPI(url, body, context,
      {successMsg, loading}) async {
    //EasyLoading.instance.userInteractions=false;
    if (loading == true && loading != null) {
      //EasyLoading.show(status: 'Please wait...');
    }

    print(token);
    print(baseURL + url);

    String bearerAuth =
        'Bearer $token';

    http.Response response;

    try {
      response = await http.put(Uri.parse(baseURL + url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': bearerAuth
          },
          body: jsonEncode(body));


      if (loading == true && loading != null) {
        //EasyLoading.dismiss();
      }

      var jsonData;
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        if (successMsg != null) {

        }
        return jsonData;
      } else if (response.statusCode == 400) {
        jsonData = json.decode(response.body);
        // CustomToast().showToast("Error",jsonData["message"], true);
        // return {};
        return jsonData;
      } else if (response.statusCode == 401) {
        jsonData = json.decode(response.body);

        return {};
      } else {
print("Status code ye ha");
print(response.statusCode);
        throw Exception('Failed');
      }
    } catch (SocketException) {
      print(SocketException);
      //EasyLoading.dismiss();
      return null;
    }
  }



  Future baseFormPostAPI(url, Map<String, String> body, files, keys, context,
      {successMsg, loading, pop = true}) async {
    //EasyLoading.instance.userInteractions=false;
    if (loading == true && loading != null) {
      //EasyLoading.show(status: 'Please wait...',dismissOnTap: false);
    }

    print(url);
    print(token.toString());
    String bearerAuth = 'Bearer ' + "$token";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseURL + url));

      request.headers.addAll({"Authorization": "${bearerAuth}"});

      for (int i = 0; i < files.length && files != null; i++) {
        request.files
            .add(await http.MultipartFile.fromPath(keys[i], files[i].path));
      }
      request.fields.addAll(body);

      var response = await request.send();
      if(loading==true){
        //EasyLoading.dismiss();
      }

      print(response.statusCode.toString() +"check status");


      if (response.statusCode == 200) {
        if (successMsg != null) {

        }
        if (pop == true) {
          // Modular.to.pop();
        }

        var temp = await response.stream.bytesToString();
        print(temp);

        return temp;
      }
      else if (response.statusCode == 400) {
        var temp = await response.stream.bytesToString();
        return temp;
      } else if (response.statusCode == 401) {
        var temp = await response.stream.bytesToString();
        return temp;
      } else if (response.statusCode == 500) {
        var temp = await response.stream.bytesToString();

        return temp;
      }
      else {
        throw Exception('Failed');
      }
    } catch (SocketException) {
      log(SocketException.toString());
      //EasyLoading.dismiss();
      return null;
    }
  }

  Future baseFormDataPost (String url, Map<String,String> body, files, keys, context,
      {Function(double percent, String bytesRatio)? uploadingProgress, bool back=true, msg}) async {

    log(files.length.toString());

    // UploadigDialog uploadigDialog=UploadigDialog();
    // uploadigDialog.showLoadingDialog(context);
  //   try {
  //     //videoTitle is video description???
  //     var uri = Uri.parse(baseURL + url);
  //     // var request = MultipartRequest(
  //     //   "POST",
  //     //   uri,
  //     //   onProgress: (int bytes, int total) {
  //     //     log(bytes.toString());
  //     //     final progress = bytes / total * 100;
  //     //     // uploadingProgress(progress, "$bytes/$total");
  //     //     uploadigDialog.percentage(progress);
  //     //   },
  //     // );
  //     log("here");
  //
  //     // if(files.length>0){
  //     //   for(int i=0;i<files.length;i++){
  //     //     var multiPartFile =
  //     //     await http.MultipartFile.fromPath(keys[i], files[i].path,filename: basename(files[i].path));
  //     //     // multiPartFile.finalize();
  //     //     if(multiPartFile!=null){
  //     //       request.files.add(multiPartFile);
  //     //       log("uploading started");
  //     //       log(multiPartFile.contentType.toString());
  //     //       log(multiPartFile.field);
  //     //       log(multiPartFile.filename.toString());
  //     //       log(multiPartFile.isFinalized.toString());
  //     //     }
  //     //   }
  //     // }
  //
  //     // request.fields.addAll(body);
  //     // request.headers.addAll({"Authorization": "$bearerAuth"});
  //
  //
  //
  //     final http.Response response =
  //     // await http.Response.fromStream(await request.send());
  //     // log(response.headers.toString());
  //     // log(response.statusCode.toString());
  //     // log(response.body);
  //     // if (response.statusCode == 200) {
  //     //   log(response.body);
  //     //
  //     //   Map<String, dynamic> data = jsonDecode(response.body);
  //     //   if(back) {
  //     //     Get.back();
  //     //   }
  //     //   // CustomToast().showToast("Message",data["message"]??msg??"Content has been uploaded", false);
  //     //   return true;
  //     //   // final fid = body["fid"] ?? null;
  //     //   // if (fid != null) {
  //     //   //   await updateVideoInfo(fid, videoName);
  //     //   //   final svid = body["svid"];
  //     //   //   await uploadToServer(svid, uploadVideoModel.sessionId!, uploadVideoModel.videoTitle!, uploadVideoModel.videoCategory!.id!, uploadVideoModel.videoIntensity!.id!, uploadVideoModel.videoClass!.id!);
  //     //   //   log("successfully api callleddddd----> ");
  //     //   //   pd.update(value: 100);
  //     //   //   pd.close();
  //     //   //   return true;
  //     //   // } else {
  //     //   //   pd.close();
  //     //   //   return false;
  //     //   // }
  //     // } else if(response.statusCode==401){
  //       // if(sessionExpired==false) {
  //       //   CustomToast().showToast("Session Expired",
  //       //       "Your session has been expired. Please log in again", true);
  //       //   Future.delayed(Duration(seconds: 2), () {
  //       //     // ProfileController().logout();
  //       //     sessionExpired=true;
  //       //   });
  //       // }
  // //     }else {
  // //       log(response.statusCode.toString());
  // //       log(response.body);
  // //       uploadigDialog.hideDialog();
  // //       Map<String, dynamic> data = jsonDecode(response.body);
  // //       // CustomToast().showToast("Message",data["message"], true);
  // //       return false;
  // //     }
  // //   } catch (err) {
  // //     socketExceptionDialog(context);
  // //     log(err.toString());
  // //     rethrow;
  // //   }
  // // }
  // // Future<void> socketExceptionDialog(context) async {
  // //   log("dialog");
  // //   if(internetDialog==false) {
  // //     internetDialog = true;
  //     await showDialog(context: context, builder: (context) {
  //       return AlertDialog(
  //         content: SingleChildScrollView(
  //             physics: BouncingScrollPhysics(),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               // crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Icon(
  //                   Icons.error,
  //                   color: Colors.red,
  //                   size: 30,
  //                 ),
  //                 SizedBox(height: 10),
  //                 Text( "There seems to be your network problem or a server side issue. Please try again or report the bug to the manager."),
  //                 SizedBox(height: 20),
  //               ],
  //             )),
  //         actions: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               MaterialButton(
  //                 // color: terColor,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(20.0),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
  //                   child: new Text("okay"),
  //                 ),
  //                 // color: secondaryColor,
  //                 onPressed: () {
  //                   Get.back();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     });
  //     internetDialog = false;
  //   }
  }
  // static void _logRequestOnAlice(http.Response response) {
  //   if (isDevelopmentMode==true) {
  //     alice.onHttpResponse(response);
  //   }
  // }
}
