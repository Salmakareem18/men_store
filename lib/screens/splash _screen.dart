import 'package:app_store/core/helpers/App_assets.dart';
import 'package:app_store/core/helpers/cash_helper.dart';
import 'package:app_store/screens/auth/login/login_screen.dart';
import 'package:app_store/screens/button_nav/homenav.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 8), () async {
      CashHelper.getToken().then((value) {
        if (value.isNotEmpty) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Homenav()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset(AppAssets.cartloadinggAssets)),
    );
  }
}
