import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poolino/features/add_feature/domain/repository/add_cost_repository.dart';
import 'package:poolino/features/add_feature/domain/use_cases/add_cost_usecase.dart';
import 'package:poolino/features/add_feature/presentation/bloc/add_cost_bloc/add_cost_bloc.dart';
import 'package:poolino/features/login_feature/domain/repository/verify_repository.dart';
import 'package:poolino/features/login_feature/domain/use_cases/verify_usecase.dart';
import 'package:poolino/features/login_feature/presentation/bloc/verify/verify_bloc.dart';
import 'package:poolino/features/login_feature/repository/verify_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/utils/prefs_opreator.dart';
import 'features/add_feature/data/add_cost_api_provider.dart';
import 'features/add_feature/repository/add_cost_repository_impl.dart';
import 'features/login_feature/data/api_provider.dart';
import 'features/login_feature/domain/repository/login_repository.dart';
import 'features/login_feature/domain/use_cases/login_usecase.dart';
import 'features/login_feature/presentation/bloc/login_bloc.dart';
import 'features/login_feature/repository/login_repository_impl.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<Dio>(Dio());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());


  ///repository

  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerSingleton<LoginBloc>(LoginBloc(locator()));

  //locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<VerifyRepository>(VerifyRepositoryImpl(locator()));
  locator.registerSingleton<VerifyUseCase>(VerifyUseCase(locator()));
  locator.registerSingleton<VerifyBloc>(VerifyBloc(locator()));

  locator.registerSingleton<AddCostApiProvider>(AddCostApiProvider());
  locator.registerSingleton<AddCostRepository>(AddCostRepositoryImpl(locator()));
  locator.registerSingleton<AddCostUseCase>(AddCostUseCase(locator()));
  locator.registerSingleton<AddCostBloc>(AddCostBloc(locator()));


  //locator.registerSingleton<HomeRepository>(HomeRepository(locator()));

  //locator.registerSingleton<ProductApiProvider>(ProductApiProvider(locator()));
 // locator.registerSingleton<ProductRepository>(ProductRepository(locator()));




}