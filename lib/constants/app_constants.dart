import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:health_care_app/views/errorscreens/connectionlost.dart';

class AppConstants {
  static const urlBase = 'https://abc.premedgo.com/public/api/';

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          Container(
              margin: const EdgeInsets.all(14.0),
              child: Text(
                "Please wait...",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
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
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      icon: Icon(
        Icons.error,
        color: Theme.of(context).primaryColor,
      ),
      colorText: Theme.of(context).primaryColor,
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
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      icon: Icon(
        Icons.thumb_up_outlined,
        color: Theme.of(context).primaryColor,
      ),
      colorText: Theme.of(context).primaryColor,
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
              color: Color(0xff4162EF),
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
