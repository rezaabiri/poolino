import 'package:flutter/material.dart';
import 'package:poolino/common/utils/poolino_colors.dart';

class LoadingScreen {
  LoadingScreen._();

  static show({required BuildContext context, bool cancelable = true}) {
    return showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _customDialog(context),
          ),
        );
      },
    );
  }

  static hide(BuildContext context) {
    Navigator.pop(context);
  }

  static _customDialog(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  strokeCap: StrokeCap.round,
                  valueColor: AlwaysStoppedAnimation(PoolinoColors.baseColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
