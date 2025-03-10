import 'dart:io';

import 'package:android_sms_retriever/android_sms_retriever.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:pinput/pinput.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_status.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify_button_event/verify_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify_pinput/verify_pinput_cubit.dart';
import 'package:poolino/features/login_feature/presentation/widgets/pin_put.dart';

import '../../../../common/params/verify_params.dart';
import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/utils/loading_screen.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../locator.dart';
import '../bloc/login_button/login_button_cubit.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<VerifyCodePage> {
 //OtpFieldController otpController = OtpFieldController();
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCorrect = false;
  PrefsOperator prefsOperator = locator<PrefsOperator>();

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
  void initState() {
    if (Platform.isAndroid) verifyCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 26,),
              SvgPicture.asset("assets/images/login_vector.svg", width: 200, height: 200,),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                    ".کد تایید به شماره (${prefsOperator.getSharedDataNoSync("phone")}) ارسال شد",
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
                  if (current.verifyStatus is VerifyLoading) {
                    return true;
                  }
                  return false;
                },
                listener: (context, state) {
                  if (state.verifyStatus is VerifyLoading) {
                    LoadingScreen.show(context: context);
                  }
                  if (state.verifyStatus is VerifyComplete) {
                    LoadingScreen.hide(context);
                    Navigator.pushReplacementNamed(context, "/home");
                    prefsOperator.setLoggedIn();
                    BlocProvider.of<VerifyButtonCubit>(context).changeState(true);
                  }

                  if (state.verifyStatus is VerifyError) {
                    BlocProvider.of<VerifyButtonCubit>(context).changeState(false);
                    BlocProvider.of<VerifyPinPut>(context).changeState(false);

                    VerifyError u = state.verifyStatus as VerifyError;
                    PoolinoSnackBar(
                            icon: "close.svg", type: Constants.ERROR)
                        .show(context, u.message);
                    LoadingScreen.hide(context);
                  }
                },
                builder: (context, state) {
                  if (state.verifyStatus is VerifyComplete) {
                    VerifyComplete verifyComplete =
                        state.verifyStatus as VerifyComplete;
                    prefsOperator.setSharedData(
                        "accessToken",
                        verifyComplete.verifyEntity.result!.accessToken
                            .toString());
                    prefsOperator.setSharedData(
                        "refreshToken",
                        verifyComplete.verifyEntity.result!.refreshToken
                            .toString());
                    BlocProvider.of<VerifyButtonCubit>(context).changeState(true);
                  }

                  return BlocBuilder<VerifyPinPut, VerifyPinPutState>(
                    builder: (context, state) {
                      return PoolinoTextField(
                          formKey: formKey,
                          text: "کد تایید",
                          controller: pinController,
                          onChange: (value){
                            if(value.length == 4){
                              final VerifyParams verifyParams = VerifyParams(
                                prefsOperator.getSharedDataNoSync("phone").toEnglishDigit(),
                                value.toEnglishDigit(),
                              );
                              BlocProvider.of<VerifyBloc>(context).add(LoadVerifyEvent(verifyParams));
                              BlocProvider.of<VerifyButtonCubit>(context).changeState(true);
                            }
                          });
                      return PinPut(
                        formKey: formKey,
                        pinController: pinController,
                        onChange: (pin) {
                          BlocProvider.of<VerifyButtonCubit>(context)
                              .changeState(false);
                        },
                        onComplete: (pin) {
                          final VerifyParams verifyParams = VerifyParams(
                              prefsOperator
                                  .getSharedDataNoSync("phone")
                                  .toEnglishDigit(),
                              pin.toEnglishDigit());
                          BlocProvider.of<VerifyBloc>(context)
                              .add(LoadVerifyEvent(verifyParams));
                        },
                      );
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
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<VerifyButtonCubit, VerifyButtonState>(
                builder: (context, state) {
                  return ButtonPrimary(
                    text: "تایید",
                    isEnabled: state.isCorrect,
                    onPressed: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  verifyCode() async {
    var rawNumber = "0";
    await AndroidSmsRetriever.listenForSms().then(
      (value) {
        final RegExp regExp = RegExp(r'\b\d{4}\b');
        final Iterable<Match> matches = regExp.allMatches(value.toString());
        for (Match match in matches) {
          rawNumber = match.group(0)!;
          pinController.setText(rawNumber);
          if(pinController.text.length >= 3){

            final VerifyParams verifyParams = VerifyParams(
              prefsOperator.getSharedDataNoSync("phone").toEnglishDigit(),
              rawNumber.toEnglishDigit(),
            );
            BlocProvider.of<VerifyBloc>(context).add(LoadVerifyEvent(verifyParams));
            BlocProvider.of<VerifyButtonCubit>(context).changeState(true);
          }

        }
      },
    );
  }
}
