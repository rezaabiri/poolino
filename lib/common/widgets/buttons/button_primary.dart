import 'package:flutter/material.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:poolino/common/utils/utils.dart';

class ButtonPrimary extends StatelessWidget {
  String text;
  Function() onPressed;
  ButtonPrimary({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: PoolinoColors.baseColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          )
        ),
          onPressed: onPressed,
          child: Text(text, style: theme.textTheme.titleMedium,),
      ),
    );
  }
}
