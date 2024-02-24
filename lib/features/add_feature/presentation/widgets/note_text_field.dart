import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoteTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String prefixText;
  String icon;

  final GlobalKey<FormState> formKey;

  NoteTextField({super.key, required this.formKey, required this.hint, required this.prefixText, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textDirection: TextDirection.rtl,
        minLines: 5,
        maxLines: 10,
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SvgPicture.asset(icon),
            ),
            prefixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
            fillColor: Colors.grey.shade200,
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
            hintFadeDuration: Duration(milliseconds: 300),
            hintStyle: TextStyle(fontFamily: 'regular', fontSize: 16, color: Colors.black87),

        ),
      ),
    );
  }
}
