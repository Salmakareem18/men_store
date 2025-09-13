import 'package:app_store/core/networking/dio_helper.dart';
import 'package:app_store/screens/auth/login/login_screen.dart';
import 'package:app_store/screens/button_nav/home%20screen/Home_screen.dart';
import 'package:app_store/screens/button_nav/homenav.dart';
import 'package:app_store/screens/product%20%20details%20screen/producrdetails_screen.dart';
import 'package:app_store/screens/splash%20_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
