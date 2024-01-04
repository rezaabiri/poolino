import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/utils/prefs_opreator.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());


  ///repository

  //locator.registerSingleton<HomeRepository>(HomeRepository(locator()));

  //locator.registerSingleton<ProductApiProvider>(ProductApiProvider(locator()));
 // locator.registerSingleton<ProductRepository>(ProductRepository(locator()));




}