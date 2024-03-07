import 'package:flutter/material.dart';

import '../utils/poolino_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoolinoTextField extends StatelessWidget {
  TextEditingController controller;
  String text;
  final GlobalKey<FormState> formKey;
  Function(String) onChange;
  int? maxLength = 100;
  int? maxLines = 1;
  int? minLines = 1;

  PoolinoTextField({super.key, required this.formKey, required this.text, required this.controller, this.maxLength, this.maxLines, this.minLines, required this.onChange});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    FocusNode myFocusNode = FocusNode();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: controller,
          focusNode: myFocusNode,
          keyboardType: TextInputType.phone,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorRadius: const Radius.circular(20),

          textAlign: TextAlign.end,
          cursorColor: PoolinoColors.baseColor,
          textAlignVertical: TextAlignVertical.center,
          validator: (value){
            if(value == null || value.isEmpty || value.length < 11){
              return "";
            }
            return null;
          },
          onChanged: (value){
            onChange(value);
          },
          onEditingComplete: (){

          },
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            counterText: "",
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIcon: IconButton(
              icon: SvgPicture.asset("assets/images/clear.svg", width: 30, height: 30,),
              highlightColor: Colors.blue.withOpacity(0.05),
              onPressed: () {
                controller.clear();
            },),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                width: 1.5,
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
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                    width: 3,
                    color: PoolinoColors.baseColor)
            ),
            labelText: text,
          ),
        ),
      ),
    );
  }
}
