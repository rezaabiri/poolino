import 'package:flutter/material.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import '../constants.dart';


class PoolinoSnackBar {
  late IconData icon;
  late int type;

  PoolinoSnackBar({required this.icon, required this.type});

  void showPoolinoSnackBar(BuildContext context, String message) {
    final snackbar = AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 5),
      snackBarStrategy: RemoveSnackBarStrategy(),
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      builder: ((context) {
        return Builder(
          builder: (context) {
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 72,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: type == Constants.ERROR ? Colors.red : (type==Constants.WARNING ? Colors.orangeAccent : Colors.green)  ,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: Colors.white),
                  Text(message, style: const TextStyle(fontSize: 16, fontFamily: "yekan_semibold", color: Colors.white),),
                ],
              )
            );
          }
        );
      }),
    );
    snackbar.show(context);

    /*ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 3),

      ),
    );*/
  }
}