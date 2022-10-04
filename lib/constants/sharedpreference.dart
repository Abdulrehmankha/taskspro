import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? shared;

  String get getUserToke => shared!.getString("userToken")??"";

  Future setUserData(value)async{
    await shared!.setString("userToken", value);
  }


  init() async{
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    shared = await SharedPreferences.getInstance();
    print(shared);
  }
}