import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/core/helper/auth_service.dart';
import 'package:glitask/feature/login/controller/login_cubit.dart';
import 'package:glitask/feature/login/presentation/screens/loginscreen.dart';
import 'package:glitask/feature/register/presentation/screens/registerscreen.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginscreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => LoginCubit(AuthService()),
            child: const LoginScreen(),
          ),
        );
      case Routes.rigesterscreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
