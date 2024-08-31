import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/helpers/app_regex.dart';
import 'package:flutter_advanced_app/core/widgets/password_validations.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/spacing.dart';
import 'app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginBloc>().passwordController;
    setUpPasswordControllerListener();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return ('Please Enter a Valid Email');
              }
            },
            controller: context.read<LoginBloc>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginBloc>().passwordController,
            hintText: 'password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return ('Please Enter a Valid Password');
              }
            },
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength)
        ],
      ),
    );
  }
}
