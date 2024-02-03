import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:poolino/features/home_feature/presentation/screens/income_page.dart';
import 'package:poolino/features/login_feature/presentation/screens/phone_page.dart';

import '../../../common/utils/prefs_opreator.dart';
import '../../../locator.dart';
import '../../home_feature/presentation/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoHome();
    /*PrefsOperator prefsOperator = locator<PrefsOperator>();
    if(prefsOperator.getSharedDataNoSync("loggedIn") == "true"){
      Future.delayed(const Duration(seconds: 3), (){
        Navigator.pushReplacementNamed(context, '/home');
      });

    }else{
      Future.delayed(const Duration(seconds: 3), (){
        Navigator.pushReplacementNamed(context, '/phone');
      });
    }*/


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: PoolinoColors.baseColor,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ".پولینو",
                style: TextStyle(
                    fontFamily: "bold",
                    color: Colors.white,
                    fontSize: 36),
              ),
              Text(" :) حساب هیچی از دستت در نمی ره",
                  style: TextStyle(
                      fontFamily: "medium",
                      color: Colors.white,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    PrefsOperator prefsOperator = locator<PrefsOperator>();
    var loggedIn = await prefsOperator.getIntroState();
    return Future.delayed(const Duration(seconds: 3),() {

      if(loggedIn) {
        Future.delayed(const Duration(seconds: 3), (){
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else {
        Future.delayed(const Duration(seconds: 3), (){
          Navigator.pushReplacementNamed(context, '/phone');
        });      }
    });
  }
}
