import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_app/data/local_datasources/user_local_datasources.dart';
import 'package:voco_app/data/models/user_request_model.dart';
import 'package:voco_app/data/services/auth_service.dart';
import 'package:voco_app/screens/login/login_view.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController();
});

class LoginController {
  final AuthService _authService = AuthService();
  late UserLocalDataSources _userLocalDataSources;
  String? errorMessage;

  LoginController() {
    _init();
  }

  Future<void> _init() async {
    _userLocalDataSources = await UserLocalDataSources.getInstance();
  }

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
  }

  Future<String?> login(String email, String password) async {
    try {
      var userRequestModel = UserRequestModel(email: email, password: password);
      final result = await _authService.login(userRequestModel);
      if (result.token != null) {
        await _userLocalDataSources.saveUserCredentials(email, password);
        await _userLocalDataSources.saveUserToken(result.token!);
        return result.token;
      } else {
        errorMessage = 'Kullanıcı girişi başarısız.';
        return null;
      }
    } catch (e) {
      errorMessage = e.toString();
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    await _userLocalDataSources.clearUserCredentials();
    await _userLocalDataSources.clearUserToken();
    errorMessage = null;
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-Posta giriniz.';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Geçersiz e-posta formatı.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Şifre giriniz.';
    }
    return null;
  }
}
