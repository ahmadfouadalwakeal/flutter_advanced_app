import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/helpers/spacing.dart';
import 'package:flutter_advanced_app/core/theming/styles.dart';
import 'package:flutter_advanced_app/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_app/core/widgets/email_and_password.dart';
import 'package:flutter_advanced_app/core/widgets/login_bloc_listener.dart';
import 'package:flutter_advanced_app/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_bloc.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_event.dart';
import 'package:flutter_advanced_app/features/login/ui/widgets/already_have_account_text%20.dart';
import 'package:flutter_advanced_app/features/login/ui/widgets/terms_and_Conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginBloc>().formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginEvent.started(
            LoginRequestBody(
              email: context.read<LoginBloc>().emailController.text,
              password: context.read<LoginBloc>().passwordController.text,
            ),
          ));
    }
  }
}
