import 'package:dio/dio.dart';
import 'package:kian2/core/app_string_url.dart';
abstract class BaseAuthDataSource{
  Future<Response> login(Map<String,dynamic> data);
}
class AuthDataSource extends BaseAuthDataSource{
  @override
   Future<Response> login(Map<String, dynamic> data) async{
    var response=await Dio().post(AppStringUrl.baseLoginUrl,data:data);
    return response;
  }
}