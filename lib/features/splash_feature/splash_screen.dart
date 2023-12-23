import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../home_feature/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=> Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: HomePage())));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: hexToColor("#2969FF"),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(".پولینو", style: TextStyle(fontFamily: "yekan_bold", color: Colors.white, fontSize: 36),),
              Text(" :) حساب هیچی از دستت در نمی ره", style: TextStyle(fontFamily: "yekan_regular", color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}