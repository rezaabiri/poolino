import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';

class ButtonPrimary extends StatelessWidget {
  String text;
  bool isEnabled;
  Function() onPressed;
  ButtonPrimary({super.key, required this.text, required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if(isEnabled) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: PoolinoColors.baseColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
        ),
      );
    }
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
      ),
    );
  }
}
