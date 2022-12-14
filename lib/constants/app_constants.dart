import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalinctasks/Utils/color_config.dart';

class AppConstants {
  static const urlBase = 'https://60e29b749103bd0017b4743f.mockapi.io/api/v1/';

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ColorConfig.secondaryColor,
          ),
          Container(
              margin: const EdgeInsets.all(14.0),
              child: Text(
                "Please wait...",
                style: TextStyle(
                  color: ColorConfig.secondaryColor,
                ),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showinternetDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .48,
        child: Text("Connection Lost")
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showmessage(context, msg) {
    Get.snackbar(
      "",
      "",
      titleText: const Text(
        'Error',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
      messageText: Text(
        msg,
        style: TextStyle(color: ColorConfig.darkGreyColor),
      ),
      icon: Icon(
        Icons.error,
        color: ColorConfig.secondaryColor,
      ),
      colorText: ColorConfig.primaryColor,
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static showsuccessmessage(context, msg) {
    Get.snackbar(
      "",
      "",
      titleText: const Text(
        'Success',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
      messageText: Text(
        msg,
        style: TextStyle(color: ColorConfig.primaryColor),
      ),
      icon: Icon(
        Icons.thumb_up_outlined,
        color: ColorConfig.primaryColor,
      ),
      colorText: ColorConfig.primaryColor,
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static showwaitLoaderDialog([String? message]) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: ColorConfig.secondaryColor,
            ),
            SizedBox(
              height: 8,
            ),
            Text(message ?? 'Loading...'),
          ],
        ),
      ),
    ));
  }

  // hide loading
  static void hideloading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
