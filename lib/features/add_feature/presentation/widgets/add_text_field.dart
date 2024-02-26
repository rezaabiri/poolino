import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import  'package:persian_number_utility/persian_number_utility.dart';

import '../../../../common/utils/poolino_colors.dart';

class AddTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String prefixText;
  String icon;

  final GlobalKey<FormState> formKey;

  AddTextField({super.key,
    required this.formKey,
    required this.hint,
    required this.prefixText,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.phone,
        maxLength: 40,
        controller: controller,
        onChanged: (newText){
          controller.text = newText.seRagham(separator: ",");
        },
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          counterText: "",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10, left: 15),
            child: SvgPicture.asset(icon),
          ),
          fillColor: PoolinoColors.f9Color,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none
          ),
          hintText: hint,
          hintFadeDuration: const Duration(milliseconds: 300),
          hintStyle: const TextStyle(fontFamily: 'regular', fontSize: 16, color: Colors.black87),
          suffixText: "  $prefixText",
          suffixStyle: TextStyle(fontFamily: 'medium', color: Colors.grey.shade400)
        ),
      ),
    );
  }
}
