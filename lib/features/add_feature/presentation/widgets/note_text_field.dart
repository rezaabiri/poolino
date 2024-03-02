import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/utils/poolino_colors.dart';

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
      child: Stack(
        children: [
          TextField(
            textDirection: TextDirection.rtl,
            minLines: 5,
            maxLines: null,
            maxLength: 400,
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              contentPadding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1, right: 12, bottom: 0, left: 12),
              fillColor: PoolinoColors.f0Color,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 8),
            child: Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 10,),
                const Text("توضیحات", style: TextStyle(fontFamily: 'regular', fontSize: 16, color: Colors.black87)),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
