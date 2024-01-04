
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme_cubit.dart';
import 'my_theme.dart';
class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark? CupertinoIcons.moon_stars_fill : CupertinoIcons.sun_max_fill,
        color: Theme.of(context).brightness == Brightness.dark? Colors.blue : Colors.blue
      ),
      onPressed: () {
        BlocProvider.of<ThemeCubit>(context).state == MyThemes.darkTheme
            ? BlocProvider.of<ThemeCubit>(context).setLightTheme()
            : BlocProvider.of<ThemeCubit>(context).setDarkTheme();
      },


    );
  }
}