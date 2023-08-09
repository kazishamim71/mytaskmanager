import 'dart:convert';

import 'package:mytaskmanager/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility{
  AuthUtility._();
  static LoginModel userInfo=LoginModel();

  static Future<void> saveUserInfo(LoginModel model)async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    await sharedPrefs.setString('user-data', jsonEncode(model.toJson()));
  }
  static Future<LoginModel> getUserInfo(LoginModel model)async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    String value= sharedPrefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }
  static Future<void> clearUserInfo()async {
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }
  static Future<bool> checkUserLoggedIn() async{
    SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
    bool isLogin=sharedPrefs.containsKey('user-data');
   /* if(isLogin){

      userInfo= await getUserInfo(LoginModel());
    }*/
     return isLogin;

  }

}