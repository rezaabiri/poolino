import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/poolino_colors.dart';

class PoolinoSnackBar {
  late IconData icon;
  late int type;

  PoolinoSnackBar({required this.icon, required this.type});

  void show(BuildContext context, String message) {
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
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: type == Constants.ERROR ? PoolinoColors.error : (type==Constants.WARNING ? PoolinoColors.warning : PoolinoColors.success),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: Colors.white),
                  Expanded(child: Text(message, style: const TextStyle(fontSize: 14, fontFamily: "regular", color: Colors.white), textDirection: TextDirection.rtl,)),
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