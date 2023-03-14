import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefHelper{
  static late SharedPreferences sharedPreferences;
  static Future sharedPrefInstance()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
}