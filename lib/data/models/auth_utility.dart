import 'dart:convert';

import 'package:mytaskmanager/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility{
  AuthUtility._();

  static Future<void> saveUserInfo(LoginModel model)async {
    SharedPreferences _sharedPrefs= await SharedPreferences.getInstance();
    await _sharedPrefs.setString('user-data', model.toJson().toString());
  }
  static Future<LoginModel> getUserInfo(LoginModel model)async {
    SharedPreferences _sharedPrefs= await SharedPreferences.getInstance();
    String value= _sharedPrefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }
  static Future<void> clearUserInfo()async {
    SharedPreferences _sharedPrefs= await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
  }
  static Future<bool> checkUserLoggedIn() async{
    SharedPreferences _sharedPrefs= await SharedPreferences.getInstance();
    return _sharedPrefs.containsKey('user-data');

  }

}