import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:poolino/common/resources/data_state.dart';
import 'package:poolino/common/widgets/buttons/button_primary.dart';
import 'package:poolino/common/widgets/poolino_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolino/features/login_feature/domain/entities/login_entity.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_status.dart';

import '../../../../common/theme/ThemeSwitcher.dart';
import '../../../common/params/login_params.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<PhonePage> {
  OtpFieldController otpController = OtpFieldController();
  final phoneController = TextEditingController();
  List<String> nums = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginParams loginParams = LoginParams("reza@gmail.com", "123456789");

    BlocProvider.of<LoginBloc>(context).add(LoadLoginEvent(loginParams));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: const [ThemeSwitcher()],
          ),
          body: /*SingleChildScrollView(
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
          )*/
        BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
            if(state.loginStatus is LoginLoading){
              return const Center(child: Text("loading"),);
            }
            if(state.loginStatus is LoginComplete){
              final LoginComplete loginComplete = state.loginStatus as LoginComplete;
              final LoginEntity loginEntity = loginComplete.loginEntity;

              return Center(child: Text(loginEntity.result!.accessToken.toString()),);
            }
            if(state.loginStatus is LoginError){
              final LoginError loginError = state.loginStatus as LoginError;
              print(loginError.message.toString());
              return const Center(child: Text("error"),);
            }

            return Container();

        },)

      ),
    );
  }
}
