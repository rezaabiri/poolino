import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:poolino/common/utils.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/login_feature/widgets/poolino_keyboard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../common/constants.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhonePage> {
  OtpFieldController otpController = OtpFieldController();
  final phoneController = TextEditingController();
  List<String> nums = [];

  List<String> number = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "ارسال کد",
    "00",
  ];
  List<String> type = [
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "number",
    "text",
    "icon",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/login_vector.svg"),
              const SizedBox(
                height: 24,
              ),
              const Center(
                child: Text(
                  "جهت ورود به برنامه شماره موبایل خود را وارد نمایید.",
                  style: TextStyle(fontFamily: "yekan_bold", fontSize: 16),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  maxLines: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorRadius: const Radius.circular(20),
                  textAlign: TextAlign.center,
                  cursorColor: Utils.hexToColor(PoolinoColors.baseColor),
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(fontSize: 18, fontFamily: "yekan_bold"),
                  decoration: InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    counterStyle: TextStyle(fontFamily: "yekan_regular", fontSize: 12),
                    labelStyle: const TextStyle(
                        fontFamily: "yekan_regular",
                        fontSize: 16,
                        color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2,
                        color: Utils.hexToColor(PoolinoColors.baseColor),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1,
                            color: Utils.hexToColor(PoolinoColors.baseColor))),
                    labelText: 'شماره موبایل',
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
