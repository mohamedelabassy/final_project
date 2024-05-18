import 'package:final_project/layout/home/screen/home_screen.dart';
import 'package:final_project/layout/on_boarding/screen/splash_screen.dart';
import 'package:final_project/routers/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouters.onGenerateRoute,
      navigatorKey: AppRouters.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
