import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:figma_squircle/figma_squircle.dart';




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
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: PoolinoColors.baseColor,
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 14,
                cornerSmoothing: 1,

              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
        ),
      );
    }
    return Container(
      height: 55,
      decoration: ShapeDecoration(
        color: PoolinoColors.disableButtonColor,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 14,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontFamily: 'regular', fontSize: 14, color: Colors.white),),
      ),
    );
  }
}
