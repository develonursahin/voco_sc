// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:voco_app/data/local_datasources/user_local_datasources.dart';
import 'package:voco_app/data/models/user_request_model.dart';
import 'package:voco_app/data/models/user_response_model.dart';
import 'package:voco_app/data/services/auth_service.dart';
import 'package:voco_app/screens/home/home_view.dart';
import 'package:voco_app/screens/login/login_view.dart';

class SplashController extends StatefulWidget {
  const SplashController({super.key});

  @override
  State<SplashController> createState() => _SplashControllerState();
}

class _SplashControllerState extends State<SplashController> {
  late UserLocalDataSources userLocalDataSources;
  late AuthService authService;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async => await init());
  }

  Future<void> init() async {
    userLocalDataSources = await UserLocalDataSources.getInstance();
    authService = AuthService();
    await userLoginControl();
  }

  Future<void> userLoginControl() async {
    UserResponseModel login = UserResponseModel();
    String? userToken = "";
    var email = userLocalDataSources.getEmail();
    var password = userLocalDataSources.getPassword();
    var userRequestModel = UserRequestModel(email: email, password: password);
    if (email != null && password != null) {
      login = await authService.login(userRequestModel);
      userToken = userLocalDataSources.getUserToken();
    }
    if (login.token == userToken) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
