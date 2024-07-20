import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glitask/core/routes/app_route.dart';
import 'package:glitask/core/routes/routes.dart';

class GlitaskApp extends StatelessWidget {
  const GlitaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginscreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
