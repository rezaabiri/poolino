
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolino/common/theme/custom_cubit/poolino_theme_cubit.dart';


class PoolinoTheme {
  static Color primaryColor(BuildContext context) {
    return BlocProvider.of<PoolinoThemeCubit>(context).state==0
        ? Colors.white
        : Colors.black;
  }

  static Color secondaryColor(BuildContext context) {
    return BlocProvider.of<PoolinoThemeCubit>(context).state==0
        ? Colors.red
        : Colors.blue;
  }
}