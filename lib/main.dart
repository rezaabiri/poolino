import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolino/features/add_feature/presentation/bloc/category_cubit/category_cubit.dart';
import 'package:poolino/features/add_feature/presentation/bloc/priority_cubit/priority_cubit.dart';
import 'package:poolino/features/add_feature/presentation/screens/add_container_page.dart';
import 'package:poolino/features/home_feature/presentation/screens/all_transactions_page.dart';
import 'package:poolino/features/home_feature/presentation/screens/home_page.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_button/login_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify_button_event/verify_button_cubit.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify_pinput/verify_pinput_cubit.dart';
import 'package:poolino/features/login_feature/presentation/screens/phone_page.dart';
import 'package:poolino/features/login_feature/presentation/screens/verify_code_page.dart';
import 'package:poolino/features/splash_feature/screens/splash_screen.dart';

import 'common/theme/cubit/theme_cubit.dart';
import 'common/theme/my_theme.dart';
import 'features/add_feature/presentation/bloc/add_cost_bloc/add_cost_bloc.dart';
import 'locator.dart';
import 'package:telephony/telephony.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  final ThemeCubit themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ThemeCubit()),
    BlocProvider.value(value: themeCubit),
    BlocProvider(create: (_) => locator<LoginBloc>()),
    BlocProvider(create: (_) => VerifyButtonCubit()),
    BlocProvider(create: (_) => LoginButtonCubit()),
    BlocProvider(create: (_) => locator<VerifyBloc>()),
    BlocProvider(create: (_) => VerifyPinPut()),
    BlocProvider(create: (_) => locator<AddCostBloc>()),
    BlocProvider(create: (_) => CategoryCubit()),
    BlocProvider(create: (_) => PriorityCubit()),
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
        statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light
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
            routes: {
              '/verify': (context) => const VerifyCodePage(),
              '/home': (context) => const HomePage(),
              '/splash': (context) => const SplashScreen(),
              '/phone': (context) => const PhonePage(),
              '/add_container':(context) => AddContainerPage(),
              '/all_transaction':(context) => const AllTransactionsPage(),
            },
            home: Scaffold(
                key: scaffoldKey,
                body: const SplashScreen()
            )
        );
      },
    );
  }
}
