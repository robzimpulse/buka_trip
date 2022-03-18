import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

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

  Widget form(Size size) {
    if (_isRegisterScreen) {
      return RegisterForm(
        size: size,
        onTapLogin: onTapLogin,
        onTapForgetPassword: onTapForgetPassword,
        onTapSubmit: () => { },
      );
    }

    if (_isForgetPasswordScreen) {
      return ForgetPasswordForm(
        size: size,
        onTapLogin: onTapLogin,
        onTapRegister: onTapRegister,
        onTapSubmit: () => {  },
      );
    }

    return LoginForm(
      size: size,
      onTapRegister: onTapRegister,
      onTapForgetPassword: onTapForgetPassword,
      onTapSubmit: () => { },
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
            child: form(size),
          ),
        ),
      ),
    );
  }
}