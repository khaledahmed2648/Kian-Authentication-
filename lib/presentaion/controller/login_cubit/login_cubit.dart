import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian2/data/models/user_model.dart';
import 'package:kian2/domain/usecase/login_usecase.dart';
import 'package:dio/dio.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController userController=TextEditingController();
  TextEditingController passController=TextEditingController();
  RequestStatus requestStatus=RequestStatus.initial;
  String errorMessage='';
  bool isPasswordHidden=true;
  UserModel? userModel;
  Future login()async{
    requestStatus=RequestStatus.loading;
    emit(DoLoginStateLoading());
    await loginUseCase.call({
      'username':userController.text,
      'password':passController.text,
    }).then((value){
      userModel=UserModel.fromJson(value.data);
      print('success');
      print(value.data);
      requestStatus=RequestStatus.success;
      emit(DoLoginStateSuccess());
    }).catchError((error){
      print('error');
      print(error);
      errorMessage=error.toString();
      requestStatus=RequestStatus.error;
      emit(DoLoginStateError());
    });


  }
  changePasswordStatus(){
    isPasswordHidden=!isPasswordHidden;
    emit(ChangePasswordState());
  }

}
enum RequestStatus{
  initial,
  loading,success,error
}