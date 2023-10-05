import 'package:flutter/material.dart';
import 'package:voco_app/screens/login/login_controller.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.passwordController,
    required this.showPassword,
    required this.passwordErrorText,
    required this.loginController,
    this.onPressed,
  });

  final TextEditingController passwordController;
  final bool showPassword;
  final String? passwordErrorText;
  final LoginController loginController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: 'Şifre',
        errorText: passwordErrorText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: const TextStyle(fontSize: 16.0, color: Colors.black),
      validator: (value) => loginController.validatePassword(value),
    );
  }
}
