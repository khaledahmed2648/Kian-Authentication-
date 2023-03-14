import 'package:flutter/material.dart';
import 'package:kian2/presentaion/controller/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian2/presentaion/screens/admin_home_screen.dart';
import 'package:kian2/presentaion/screens/employer_home_screen.dart';
import '../widgets/custom_login_cover.dart';
import '../widgets/customloginfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (cubit.requestStatus == RequestStatus.success) {
          showDialog(context: context, builder:(context)=> AlertDialog(
            content:Text('You Have Been Logged In Successfully',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,) ,
            icon:Icon(Icons.check_circle_outline,color: Colors.green,size: 100,) ,
          ));
          if(cubit.userModel!.rolePosition=='user'){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>EmployerHomeScreen()));
          }else if(cubit.userModel!.rolePosition=='admin'){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminHomeScreen()));

          }
          cubit.requestStatus = RequestStatus.initial;
        }if(cubit.requestStatus == RequestStatus.error){
          showDialog(context: context, builder:(context)=> AlertDialog(
            content:Text('Email Or Password is not correct',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,) ,
            icon:Icon(Icons.close,color: Colors.red,size: 100,) ,
          ));
          cubit.requestStatus = RequestStatus.initial;

        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white70,
          body: ListView(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const CustomLoginCover(),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: 200),
                    width: 330,
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        const Text('Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 50,
                        ),
                        CustomLoginField(
                            prefexIcon: Icons.important_devices,
                            hint: 'ID',
                            controller: cubit.userController),
                        SizedBox(
                          height: 30,
                        ),
                        CustomLoginField(
                          prefexIcon: Icons.lock,
                          hint: 'Password',
                          controller: cubit.passController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              cubit.isPasswordHidden?
                              Icons.visibility:Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              cubit.changePasswordStatus();
                            },
                          ),
                          isPassword: cubit.isPasswordHidden,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 645),
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:cubit.requestStatus==RequestStatus.loading?CircularProgressIndicator(color: Colors.orangeAccent,):
                    GestureDetector(
                      onTap: () async {


                        await cubit.login();
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
