import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poolino/date_picker.dart';
import 'package:poolino/features/home_feature/pages/home_page.dart';
import 'package:poolino/features/home_feature/widgets/toolbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: HomePage()
        ))
      )
    );
  }
}
