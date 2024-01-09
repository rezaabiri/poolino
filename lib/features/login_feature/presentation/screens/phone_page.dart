import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:poolino/common/constants.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/loading.dart';
import 'package:poolino/common/widgets/poolino_snackbar.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolino/features/login_feature/domain/entities/login_entity.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_button/login_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_status.dart';
import 'package:poolino/features/login_feature/presentation/screens/verify_code_page.dart';
import '../../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/params/login_params.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../locator.dart';
import '../../../home_feature/presentation/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:delayed_widget/delayed_widget.dart';




class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhonePage> {
  OtpFieldController otpController = OtpFieldController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> nums = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    PrefsOperator prefsOperator = locator<PrefsOperator>();


    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: const [ThemeSwitcher()],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DelayedWidget(
                      animationDuration: const Duration(seconds: 1),// Not required
                      animation: DelayedAnimations.SLIDE_FROM_TOP,
                      child: SvgPicture.asset("assets/images/login_vector.svg")
                  ),
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
                    formKey: formKey,
                    text: "شماره موبایل",
                    controller: phoneController,
                    maxLength: 11,
                    maxLines: 1,
                    onChange: (value) {
                      if(value.length != 11){
                        BlocProvider.of<LoginButtonCubit>(context).changeState(false);
                      }else{
                        BlocProvider.of<LoginButtonCubit>(context).changeState(true);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
                    /*     buildWhen: (previous, current){
                      if(current.loginStatus is LoginComplete) {
                        return true;
                      }
                      return false;},*/

                      listenWhen: (previous, current) {
                        if (current.loginStatus is LoginComplete) {
                          return true;
                        }
                        return false;
                      },

                      builder: (context, state) {
                        if (state.loginStatus is LoginLoading) {
                          return const Loading();
                        }
                        if (state.loginStatus is LoginComplete) {
                          LoginComplete loginComplete = state
                              .loginStatus as LoginComplete;
                          LoginEntity loginEntity = loginComplete.loginEntity;
                        }

                        return BlocBuilder<LoginButtonCubit, LoginButtonState>(
                          builder: (context, state) {
                            return ButtonPrimary(
                              text: "تایید شماره موبایل",
                              isEnabled: state.isCorrect,
                              onPressed: () {
                                LoginParams loginParams = LoginParams(
                                    "reza@gmail.com", "123456");
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoadLoginEvent(loginParams));
                              },
                            );
                          },
                        );
                      },
                      listener: (context, state) {
                        //LoginStatus login = state.loginStatus;
                        LoginComplete loginen = state
                            .loginStatus as LoginComplete;
                        LoginEntity entity = loginen.loginEntity;
                        prefsOperator.setSharedData(
                            "accessToken", entity.result?.accessToken);

                        PoolinoSnackBar(
                            icon: CupertinoIcons.checkmark_shield,
                            type: Constants.SUCCESS
                        ).show(context, "دیتاها دریافت شد");

                        Navigator.pushReplacement(
                            context,
                            PageTransition(type: PageTransitionType.rightToLeft,
                                child: VerifyCodePage()));
                      })
                ],
              ),
            ),
          )

      ),
    );
  }
}
