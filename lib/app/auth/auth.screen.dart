import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';

import 'widgets/index.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  bool _isRegisterScreen = false;
  bool _isForgetPasswordScreen = false;
  bool _isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTapRegister() {
    setState(() {
      _isRegisterScreen = true;
      _isForgetPasswordScreen = false;
    });
  }

  void onTapLogin() {
    setState(() {
      _isRegisterScreen = false;
      _isForgetPasswordScreen = false;
    });
  }

  void onTapForgetPassword() {
    setState(() {
      _isRegisterScreen = false;
      _isForgetPasswordScreen = true;
    });
  }

  void onTapSubmitRegisterForm() {
    setState(() { _isLoading = true; });
    Log.debug("register with ${emailController.text} | ${passwordController.text}");
  }

  void onTapSubmitLoginForm() {
    setState(() { _isLoading = true; });
    Log.debug("login with ${emailController.text} | ${passwordController.text}");
  }

  void onTapSubmitForgetPasswordForm() {
    setState(() { _isLoading = true; });
    Log.debug("forget password with ${emailController.text}");
  }

  Widget form(Size size) {
    if (_isRegisterScreen) {
      return RegisterForm(
        usernameController: usernameController,
        emailController: emailController,
        passwordController: passwordController,
        passwordConfirmController: passwordConfirmController,
        size: size,
        onTapLogin: onTapLogin,
        onTapForgetPassword: onTapForgetPassword,
        onTapSubmit: onTapSubmitRegisterForm,
      );
    }

    if (_isForgetPasswordScreen) {
      return ForgetPasswordForm(
        emailController: emailController,
        size: size,
        onTapLogin: onTapLogin,
        onTapRegister: onTapRegister,
        onTapSubmit: onTapSubmitForgetPasswordForm,
      );
    }

    return LoginForm(
      emailController: emailController,
      passwordController: passwordController,
      size: size,
      onTapRegister: onTapRegister,
      onTapForgetPassword: onTapForgetPassword,
      onTapSubmit: onTapSubmitLoginForm,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.height,
          child: Center(
            child: Visibility(
              visible: _isLoading,
              replacement: form(size),
              child: const CircularProgressIndicator(color: Colors.grey)
            ),
          ),
        ),
      ),
    );
  }
}