import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/routing/routes.dart';
import 'package:flutter_advanced_app/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced_app/features/home/ui/home_screen.dart';
import 'package:flutter_advanced_app/features/login/logic/bloc/login_bloc.dart';
import 'package:flutter_advanced_app/features/login/ui/login_screen.dart';
import 'package:flutter_advanced_app/features/sign_up/logic/bloc/sign_up_bloc.dart';
import 'package:flutter_advanced_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/onboarding/onboarding_screen.dart';
import '../di/dependancy_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginBloc>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpBloc>(),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecializations(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
