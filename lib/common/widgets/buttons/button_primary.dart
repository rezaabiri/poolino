import 'package:flutter/material.dart';

import '../../utils/poolino_colors.dart';

class ButtonPrimary extends StatelessWidget {
  String text;
  bool isEnabled;
  Function() onPressed;
  ButtonPrimary({super.key, required this.text, required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if(isEnabled) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: PoolinoColors.baseColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
            )
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
        ),
      );
    }
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: PoolinoColors.disableButtonColor,
        borderRadius: BorderRadius.circular(14)
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
      ),
    );
  }
}
