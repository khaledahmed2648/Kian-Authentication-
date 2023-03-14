import 'package:flutter/material.dart';

class CustomLoginField extends StatelessWidget {
  final IconData prefexIcon;
  final IconButton? suffixIcon;
  final bool isPassword;
  final String hint;
  final TextEditingController controller;

  const CustomLoginField({
    super.key,
    required this.prefexIcon,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.isPassword=false
  });

  @override
  Widget build(BuildContext context) {
    return   Container(
      width:250,
      height: 40,
      alignment: AlignmentDirectional.centerStart,
      child: TextFormField(
      controller: controller,
        style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
        obscureText: isPassword,
        decoration: InputDecoration(

            hintText: hint,
            prefixIcon: Icon(prefexIcon,color: Colors.grey,size: 20,),
            suffixIcon:suffixIcon,

            contentPadding: EdgeInsets.all(7),
            focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(5),borderSide:BorderSide(color: Colors.grey)  ) ,
            border: OutlineInputBorder(borderRadius:BorderRadius.circular(5),borderSide:BorderSide(color: Colors.grey)  )
        ),
      ),
    );
  }
}
