import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../poolino_colors.dart';

class PoolinoTextField extends StatelessWidget {
  TextEditingController controller;
  String text;
  int? maxLength = 100;
  int? maxLines = 1;
  int? minLines = 1;

  PoolinoTextField({super.key, required this.text, required this.controller, this.maxLength, this.maxLines, this.minLines});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = Theme.of(context).colorScheme;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursorRadius: const Radius.circular(20),
        textAlign: TextAlign.center,
        cursorColor: PoolinoColors.baseColor,
        textAlignVertical: TextAlignVertical.center,
        style: theme.textTheme.titleLarge,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          counterText: "",
          labelStyle: TextStyle(color: colorScheme.onPrimary),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: PoolinoColors.baseColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: PoolinoColors.e4Color,
            )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  width: 3,
                  color: PoolinoColors.baseColor)
          ),
          labelText: text,
        ),
      ),
    );
  }
}
