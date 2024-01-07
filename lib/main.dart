import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poolino/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:poolino/features/login_feature/screens/phone_page.dart';

import 'common/theme/cubit/theme_cubit.dart';
import 'common/theme/my_theme.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  final ThemeCubit themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ThemeCubit()),
    BlocProvider.value(value: themeCubit),
    BlocProvider(create: (_) => locator<LoginBloc>())
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
    var theme = Theme.of(context).canvasColor;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.grey
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
