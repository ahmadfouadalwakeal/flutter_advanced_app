import 'package:dio/dio.dart';
import 'package:flutter_advanced_app/core/networking/api_service.dart';
import 'package:flutter_advanced_app/core/networking/dio_factory.dart';
import 'package:flutter_advanced_app/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_bloc.dart';
import 'package:flutter_advanced_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_advanced_app/features/sign_up/logic/bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt()));
  //signUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpBloc>(() => SignUpBloc(getIt()));
}
