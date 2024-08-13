import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_event.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;

  LoginBloc(this._loginRepo) : super(LoginState.initial()) {
    on<LoginEvent>(emitLoginState);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(event.loginRequestBody);
    response.when(success: (loginResponse) {
      emit(
        LoginState.success(loginResponse),
      );
    }, failure: (error) {
      emit(
        LoginState.error(error: error.apiErrorModel.message ?? ''),
      );
    });
  }
}
