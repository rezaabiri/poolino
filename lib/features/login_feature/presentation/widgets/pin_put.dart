import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPut extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController pinController;
  final String isValid;
  final Function(String) onComplete;
  final Function(String) onChange;
  PinPut({super.key, required this.formKey, required this.pinController, required this.isValid, required this.onChange,required this.onComplete});
  final focusNode = FocusNode();
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              errorTextStyle: const TextStyle(fontSize: 0, color: Colors.red, fontFamily: 'regular'),
              separatorBuilder: (index) => const SizedBox(width: 16),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              validator: (value) {
                return value=='0' ? null : '';
              },
              onCompleted: (pin) {
                onComplete(pin);
              },
              onChanged: (value) {
                onChange(value);
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: Colors.white,
                  border: Border.all(color: Colors.green),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.red)
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
