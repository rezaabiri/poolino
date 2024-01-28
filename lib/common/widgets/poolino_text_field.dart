import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:figma_squircle/figma_squircle.dart';


import '../poolino_colors.dart';

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
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            counterText: "",
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: theme.canvasColor, size: 20,),
              highlightColor: Colors.blue.withOpacity(0.05),
              onPressed: () {
                controller.clear();
            },),

            focusedBorder: OutlineInputBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 14,
                cornerSmoothing: 1,
              ),
              borderSide: BorderSide(
                width: 1,
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
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 14,
                  cornerSmoothing: 1,
                ),
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
