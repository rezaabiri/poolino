import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';

import '../../../common/utils/prefs_opreator.dart';
import '../../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                    fontFamily: "bold", color: Colors.white, fontSize: 36),
              ),
              Text(
                " :) حساب هیچی از دستت در نمی ره",
                style: TextStyle(
                    fontFamily: "medium", color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    PrefsOperator prefsOperator = locator<PrefsOperator>();
    var loggedIn = await prefsOperator.getLoggedIn();
    _timer = Timer(const Duration(seconds: 2), () {
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, '/add_container');
      } else {
        Navigator.pushReplacementNamed(context, '/add_container');
      }
    });
  }
}
