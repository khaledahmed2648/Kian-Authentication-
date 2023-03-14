import 'package:kian2/data/data_source/Auth_data_source.dart';
import 'package:dio/dio.dart';
class LoginUseCase{
  final BaseAuthDataSource baseAuthDataSource;

  LoginUseCase(this.baseAuthDataSource);
  Future<Response> call(Map<String,dynamic> data){
    return baseAuthDataSource.login(data);
  }
}