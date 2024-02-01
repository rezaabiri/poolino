import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:poolino/common/base_model.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/features/home_feature/presentation/screens/home_page.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_status.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify_button_event/verify_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/widgets/pin_put.dart';

import '../../../../common/constants.dart';
import '../../../../common/params/verify_params.dart';
import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/widgets/loading.dart';
import 'package:page_transition/page_transition.dart';


class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<VerifyCodePage> {
  OtpFieldController otpController = OtpFieldController();
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCorrect = false;

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
    var theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [ThemeSwitcher()],
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/login_vector.svg"),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(".کد تایید به شماره (09150575854) ارسال شد",
                      style: theme.textTheme.labelLarge),
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocConsumer<VerifyBloc, VerifyState>(
                  listenWhen: (previous, current) {
                    if (current.verifyStatus is VerifyComplete) {
                      return true;
                    }
                    if (current.verifyStatus is VerifyError) {
                      return true;
                    }
                    return false;
                  },

                  listener: (context, state) {
                    if (state.verifyStatus is VerifyComplete) {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(type: PageTransitionType.rightToLeft,
                              child: HomePage()));
                      BlocProvider.of<VerifyButton>(context).changeState(true);
                    }

                    if(state.verifyStatus is VerifyError){
                      BlocProvider.of<VerifyButton>(context).changeState(false);
                      PoolinoSnackBar(
                          icon: CupertinoIcons.clear,
                          type: Constants.ERROR)
                          .show(context, "کد تایید صحیح نیست");
                    }

                  },
                  builder: (context, state) {
                    if (state.verifyStatus is VerifyLoading) {
                      return const Loading();
                    }
                    if (state.verifyStatus is VerifyComplete) {
                      VerifyComplete verifyComplete = state.verifyStatus as VerifyComplete;

                      BlocProvider.of<VerifyButton>(context).changeState(true);
                    }

                    return PinPut(
                      formKey: formKey,
                      pinController: pinController,
                      isValid: '000',
                      onChange: (pin) {
                        BlocProvider.of<VerifyButton>(context).changeState(false);
                      },
                      onComplete: (pin) {
                        final VerifyParams verifyParams = VerifyParams("09150575854", pin);
                        BlocProvider.of<VerifyBloc>(context).add(
                            LoadVerifyEvent(verifyParams));

                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ویرایش شماره",
                      style: TextStyle(
                          fontFamily: 'medium',
                          fontSize: 12,
                          color: theme.primaryColor),
                    ),
                    Text(
                      "ارسال مجدد کد تایید: 01:30",
                      style: theme.textTheme.labelMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<VerifyButton, VerifyButtonState>(
                  builder: (context, state) {
                    return ButtonPrimary(
                        text: "تایید",
                        isEnabled: state.isCorrect,
                        onPressed: () {

                        });
                  },
                ),
              ],
            ),
          ),
        ));
  }

/*Form form(){
    var theme = Theme.of(context);

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
              errorTextStyle: TextStyle(fontSize: 0, color: Colors.red, fontFamily: 'regular'),
              separatorBuilder: (index) => const SizedBox(width: 16),
              validator: (value) {
                return value == '2222' ? null : '';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
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
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme:  PinTheme(
                width: MediaQuery.of(context).size.width/4,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 1),
                ),
              ),
              errorTextStyle: TextStyle(fontSize: 0, color: Colors.red, fontFamily: 'regular'),
              separatorBuilder: (index) => const SizedBox(width: 30),
              validator: (value) {
                return value == '2222' ? null : '';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
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
              focusedPinTheme: PinTheme(
                width: MediaQuery.of(context).size.width/4,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              */ /*focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),*/ /*
              submittedPinTheme:  PinTheme(
                width: MediaQuery.of(context).size.width/4,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green, width: 1),
                ),
              ),
              errorPinTheme:  PinTheme(
                width: MediaQuery.of(context).size.width/4,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 1),
                ),
              ),
            ),
          ),
          */ /*TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
            },
            child: const Text('Validate'),
          ),*/ /*
        ],
      ),
    );

  }*/
}
