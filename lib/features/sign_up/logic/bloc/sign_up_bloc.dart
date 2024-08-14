import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_advanced_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_advanced_app/features/sign_up/logic/bloc/sign_up_event.dart';
import 'package:flutter_advanced_app/features/sign_up/logic/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpBloc(this._signUpRepo) : super(SignUpState.initial()) {
    on<SignUpEvent>(emitSignUpStates);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(const SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signUpResponse) {
      emit(SignUpState.signUpSuccess(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
