import 'package:flutter/material.dart';
import 'package:glitask/core/routes/app_route.dart';
import 'package:glitask/core/routes/routes.dart';

class GlitaskApp extends StatelessWidget {
  const GlitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginscreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
