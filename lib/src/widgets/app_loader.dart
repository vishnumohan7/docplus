import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return  Lottie.asset("assets/lottie/doc.json",width: 200,
       height: 200,
       fit: BoxFit.fill,);
  }
}
