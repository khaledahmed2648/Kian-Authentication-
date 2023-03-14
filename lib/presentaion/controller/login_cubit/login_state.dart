part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangePasswordState extends LoginState {}
class DoLoginStateLoading extends LoginState {}
class DoLoginStateSuccess extends LoginState {}
class DoLoginStateError extends LoginState {}
