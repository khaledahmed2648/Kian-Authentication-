import 'package:flutter/material.dart';

import '../../core/images.dart';

class CustomLoginCover extends StatelessWidget {
  const CustomLoginCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.only(
          top: 20,
        ),
        width: double.infinity,
        height: 250,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child:const  Image(
          image: AssetImage(AppAssetsImageUrl.loginImage),
          fit: BoxFit.cover,
        ));
  }
}
