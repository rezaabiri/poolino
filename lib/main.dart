import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poolino/date_picker.dart';
import 'package:poolino/features/home_feature/screens/home_page.dart';
import 'package:poolino/features/home_feature/widgets/toolbar_widget.dart';
import 'package:poolino/features/login_feature/screens/phone_page.dart';
import 'package:poolino/features/login_feature/screens/verify_code_page.dart';
import 'package:poolino/features/splash_feature/screens/splash_screen.dart';

import 'common/theme/cubit/theme_cubit.dart';
import 'common/theme/my_theme.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();

  final ThemeCubit themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ThemeCubit()),
    BlocProvider.value(value: themeCubit)
  ], child: const MyApp(),),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: state,
            darkTheme: MyThemes.darkTheme,
            home: Scaffold(
                key: scaffoldKey,
                body: PhonePage()
            )
        );
      },
    );
  }
}
