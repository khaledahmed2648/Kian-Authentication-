import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian2/core/images.dart';
import 'package:kian2/data/data_source/Auth_data_source.dart';
import 'package:kian2/domain/usecase/login_usecase.dart';
import 'package:kian2/presentaion/controller/login_cubit/login_cubit.dart';
import 'package:kian2/presentaion/screens/login_screen.dart';

class AdminHomeScreen extends StatelessWidget {

  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        Container(
          padding: EdgeInsets.all(30),
          child:
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back'),
                    SizedBox(height: 7,),
                    Text('Admin',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 25,
                    foregroundImage: AssetImage(AppAssetsImageUrl.loginImage),
                )
              ],
            )
        ),
          SizedBox(
            height: 600,
          width: double.infinity,
            child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.5),
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.withOpacity(.4)
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.card_giftcard,size: 70,),
                      SizedBox(height: 10,),
                      Text('Admin Specialize')
                    ],
                  ),
                ),
              ),

            ],),
          ),
          Center(
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_outlined),
                  Text('LOG OUT'),
                ],
              ),
              color: Colors.orangeAccent,
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlocProvider(
  create: (context) => LoginCubit(LoginUseCase(AuthDataSource())),
  child: LoginScreen(),
)));
              },shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),),
          )
        ],
      ),
    );
  }
}
