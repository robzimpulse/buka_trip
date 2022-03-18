import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';
import 'package:provider/provider.dart';

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
  bool _isLoginButtonDisabled = false;
  bool _isRegisterButtonDisabled = false;
  bool _isForgetPasswordButtonDisabled = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  void initState() {
    usernameController.addListener(_updateButtonDisability);
    emailController.addListener(_updateButtonDisability);
    passwordController.addListener(_updateButtonDisability);
    passwordConfirmController.addListener(_updateButtonDisability);
    _updateButtonDisability();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  void _updateButtonDisability() {
    setState(() {
      _isLoginButtonDisabled = emailController.text.isEmpty == true ||
          passwordController.text.isEmpty == true;

      _isRegisterButtonDisabled = usernameController.text.isEmpty == true ||
          emailController.text.isEmpty == true ||
          passwordController.text.isEmpty == true ||
          passwordController.text != passwordConfirmController.text;

      _isForgetPasswordButtonDisabled = emailController.text.isEmpty == true;
    });
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

  Future<void> onTapSubmitRegister() async {
    try {
      setState(() { _isLoading = true; });
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String passwordConfirm = passwordConfirmController.text;
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.register(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      DialogPresenter.alert(context, title: "Error", content: "${e.message}");
    } catch (e) {
      Log.debug("onTapSubmitRegisterForm ${e.toString()}");
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  Future<void> onTapSubmitLogin() async {
    try {
      setState(() { _isLoading = true; });
      String email = emailController.text;
      String password = passwordConfirmController.text;
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.login(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      DialogPresenter.alert(context, title: "Error", content: "${e.message}");
    } catch (e) {
      Log.debug("onTapSubmitLoginForm ${e.toString()}");
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  Future<void> onTapSubmitForgetPassword() async {

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
        onTapSubmit: _isRegisterButtonDisabled ? null : onTapSubmitRegister,
      );
    }

    if (_isForgetPasswordScreen) {
      return ForgetPasswordForm(
        emailController: emailController,
        size: size,
        onTapLogin: onTapLogin,
        onTapRegister: onTapRegister,
        onTapSubmit: _isForgetPasswordButtonDisabled ? null : onTapSubmitForgetPassword,
      );
    }

    return LoginForm(
      emailController: emailController,
      passwordController: passwordController,
      size: size,
      onTapRegister: onTapRegister,
      onTapForgetPassword: onTapForgetPassword,
      onTapSubmit: _isLoginButtonDisabled ? null : onTapSubmitLogin,
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