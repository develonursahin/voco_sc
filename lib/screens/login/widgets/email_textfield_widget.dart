import 'package:flutter/material.dart';
import 'package:voco_app/screens/login/login_controller.dart';

class EmailTextFieldWidget extends StatelessWidget {
  const EmailTextFieldWidget({
    super.key,
    required this.emailController,
    required this.emailErrorText,
    required this.loginController,
  });

  final TextEditingController emailController;
  final String? emailErrorText;
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'E-Posta',
        hintText: 'example@example.com',
        errorText: emailErrorText,
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      style: const TextStyle(fontSize: 16.0, color: Colors.black),
      validator: (value) => loginController.validateEmail(value),
    );
  }
}
