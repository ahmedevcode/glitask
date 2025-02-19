import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/core/helper/auth_service.dart';
import 'package:glitask/feature/login/controller/login_cubit.dart';
import 'package:glitask/feature/login/presentation/screens/loginscreen.dart';
import 'package:glitask/feature/register/controller/cubit/register_cubit.dart';
import 'package:glitask/feature/register/presentation/screens/registerscreen.dart';
import 'package:glitask/feature/taskmanger/controller/task_cubit.dart';
import 'package:glitask/feature/taskmanger/data/repository/task_repository.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/taskmangment_screen.dart';

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
      case Routes.taskManagementScreen:
        return MaterialPageRoute(
            builder: (_) => const DefaultTabController(
                length: 3, child: TaskManagementScreen()));
      case Routes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<RegisterCubit>(
                create: (_) => RegisterCubit(AuthService()),
                child: const RegisterScreen()));
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
