import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';

class ButtonPrimary extends StatelessWidget {
  String text;
  Function() onPressed;
  ButtonPrimary({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
}
