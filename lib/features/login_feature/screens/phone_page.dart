import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poolino/common/poolino_colors.dart';
import 'package:poolino/common/utils/utils.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:poolino/features/login_feature/widgets/poolino_keyboard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '../../../common/constants.dart';
import '../../../common/theme/ThemeSwitcher.dart';

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
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [
          ThemeSwitcher()
        ],),
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/login_vector.svg"),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "جهت ورود به برنامه شماره موبایل خود را وارد نمایید.",
                  style: theme.textTheme.titleMedium,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              PoolinoTextField(
                  text: "شماره موبایل", controller: phoneController),
              const SizedBox(
                height: 40,
              ),
              ButtonPrimary(
                text: "تایید شماره موبایل",
                onPressed: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
