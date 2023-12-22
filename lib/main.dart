import 'package:flutter/material.dart';
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: ToolbarWidget(onTap: (){},),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: HomePage(),
        ))
      )
    );
  }
}
