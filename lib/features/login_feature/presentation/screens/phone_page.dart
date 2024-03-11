import 'dart:io';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:poolino/features/login_feature/domain/entities/login_entity.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_button/login_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_status.dart';
//import 'package:device_info_plus/device_info_plus.dart';

import '../../../../../common/theme/ThemeSwitcher.dart';
import '../../../../common/params/login_params.dart';
import '../../../../common/utils/loading_screen.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../locator.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhonePage> {
  //OtpFieldController otpController = OtpFieldController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> nums = [];

  @override
  initState() {
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
                  SvgPicture.asset("assets/images/login_vector.svg", color: Colors.red,),
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
                    onChange: (value) async {
                      if (value.length != 11) {
                        BlocProvider.of<LoginButtonCubit>(context)
                            .changeState(false);
                      } else {
                        BlocProvider.of<LoginButtonCubit>(context)
                            .changeState(true);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
                      listenWhen: (previous, current) {
                    if (current.loginStatus is LoginComplete) {
                      return true;
                    }
                    if (current.loginStatus is LoginLoading) {
                      return true;
                    }
                    return false;
                  }, builder: (context, state) {
                    if (state.loginStatus is LoginComplete) {
                      LoginComplete loginComplete =
                          state.loginStatus as LoginComplete;
                      LoginEntity loginEntity = loginComplete.loginEntity;
                      saveUserId(loginEntity, prefsOperator);
                    }

                    return BlocBuilder<LoginButtonCubit, LoginButtonState>(
                      builder: (context, state) {
                        return ButtonPrimary(
                          text: "تایید شماره موبایل",
                          isEnabled: state.isCorrect,
                          onPressed: () {
                            prefsOperator.setSharedData(
                                "phone", phoneController.text.toString());
                            LoginParams loginParams = LoginParams(
                                phoneController.value.text, "123456");
                            BlocProvider.of<LoginBloc>(context)
                                .add(LoadLoginEvent(loginParams));
                          },
                        );
                      },
                    );
                  }, listener: (context, state) {
                    if (state.loginStatus is LoginLoading) {
                      LoadingScreen.show(context: context);
                    }
                    if (state.loginStatus is LoginComplete) {
                      LoadingScreen.hide(context);
                      Navigator.pushNamed(context, "/verify");
                    }
                  })
                ],
              ),
            ),
          )),
    );
  }

  void saveUserId(LoginEntity loginEntity, PrefsOperator prefsOperator) async{
    await prefsOperator.setSharedData("userId", loginEntity.result?.userId.toString());
    print(await prefsOperator.getSharedData("userId"));
  }
}
