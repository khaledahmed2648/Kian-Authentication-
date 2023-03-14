import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian2/core/sharedpref_helper.dart';
import 'package:kian2/data/data_source/Auth_data_source.dart';
import 'package:kian2/domain/usecase/login_usecase.dart';
import 'package:kian2/presentaion/controller/login_cubit/login_cubit.dart';
import 'package:kian2/presentaion/screens/employer_home_screen.dart';
import 'package:kian2/presentaion/screens/login_screen.dart';
import 'package:kian2/presentaion/widgets/custom_login_cover.dart';
import 'package:kian2/presentaion/widgets/customloginfield.dart';

import 'core/images.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.sharedPrefInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LoginCubit(LoginUseCase(AuthDataSource())),
        child: LoginScreen(),
      ),
    );
  }
}

