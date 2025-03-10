import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../utils/poolino_colors.dart';

class PoolinoSnackBar {
  late String icon;
  late int type;

  PoolinoSnackBar({required this.icon, required this.type});

  void show(BuildContext context, String message) {
    final snackbar = AnimatedSnackBar(
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      duration: const Duration(seconds: 4),
      snackBarStrategy: RemoveSnackBarStrategy(),
      mobilePositionSettings: const MobilePositionSettings(
        bottomOnAppearance: 20,
      ),
      builder: ((context) {
        return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 55,
            margin: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: type == Constants.ERROR ? PoolinoColors.error : (type==Constants.WARNING ? PoolinoColors.warning : PoolinoColors.success),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/images/$icon", width: 25, height: 25, color: Colors.white),
                Expanded(child: Text(message, style: const TextStyle(fontSize: 14, fontFamily: "regular", color: Colors.white), textDirection: TextDirection.rtl,)),
              ],
            )
        );
      }),
    );
    snackbar.show(context);
  }
}