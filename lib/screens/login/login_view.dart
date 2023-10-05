// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_app/screens/home/home_view.dart';
import 'package:voco_app/screens/login/login_controller.dart';
import 'package:voco_app/screens/login/widgets/email_textfield_widget.dart';
import 'package:voco_app/screens/login/widgets/password_textfield_widget.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? emailErrorText;
  String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    final loginController = ref.read(loginControllerProvider);
    final showPassword = loginController.showPassword;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15, top: 30),
          child: Text('Giriş Yap'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
              const Text(
                "Merhaba, katılımcı listesine erişmek için lütfen giriş yapınız.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailTextFieldWidget(
                        emailController: emailController,
                        emailErrorText: emailErrorText,
                        loginController: loginController),
                    const SizedBox(height: 10),
                    PasswordTextFieldWidget(
                        passwordController: passwordController,
                        showPassword: showPassword,
                        passwordErrorText: passwordErrorText,
                        loginController: loginController,
                        onPressed: () {
                          loginController.togglePasswordVisibility();
                          setState(() {});
                        }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();

                          await Future.delayed(
                              const Duration(milliseconds: 1000));
                          var login = await loginController.login(
                            emailController.text,
                            passwordController.text,
                          );
                          if (login != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(loginController.errorMessage!),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Giriş Yap'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
