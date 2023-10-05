import 'package:flutter/material.dart';
import 'package:voco_app/screens/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashController(),
    );
  }
}
