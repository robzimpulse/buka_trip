import 'package:buka_trip/app/auth/widgets/forget_password_form.widget.dart';
import 'package:buka_trip/app/auth/widgets/login_form.widget.dart';
import 'package:buka_trip/app/auth/widgets/register_form.widget.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:buka_trip/infrastructure/service/auth.service.dart';
import 'package:buka_trip/infrastructure/util/modal.dart';
import 'package:buka_trip/infrastructure/util/log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void initState() {
    _usernameController.addListener(_updateButtonDisability);
    _emailController.addListener(_updateButtonDisability);
    _passwordController.addListener(_updateButtonDisability);
    _passwordConfirmController.addListener(_updateButtonDisability);
    _updateButtonDisability();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _updateButtonDisability() {
    setState(() {
      _isLoginButtonDisabled = _emailController.text.isEmpty ||
          _passwordController.text.isEmpty;

      _isRegisterButtonDisabled = _usernameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _passwordController.text != _passwordConfirmController.text;

      _isForgetPasswordButtonDisabled = _emailController.text.isEmpty;
    });
  }

  void _reset() {
    setState(() {
      _isRegisterScreen = false;
      _isForgetPasswordScreen = false;
      _isLoading = false;
    });
  }

  void _onTapRegister() {
    setState(() {
      _isRegisterScreen = true;
      _isForgetPasswordScreen = false;
    });
  }

  void _onTapLogin() {
    setState(() {
      _isRegisterScreen = false;
      _isForgetPasswordScreen = false;
    });
  }

  void _onTapForgetPassword() {
    setState(() {
      _isRegisterScreen = false;
      _isForgetPasswordScreen = true;
    });
  }

  Future<void> _onTapSubmitRegister() async {
    try {
      setState(() { _isLoading = true; });
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      final auth = Provider.of<AuthProvider>(context, listen: false);
      User? user = await auth.register(email: email, password: password);
      user?.updateDisplayName(username);
      user?.reload();
    } on FirebaseAuthException catch (e) {
      Modal.alert(context, title: "Error", content: "${e.message}");
      setState(() { _isLoading = false; });
    } catch (e) {
      Log.debug("onTapSubmitRegisterForm ${e.toString()}");
    }
  }

  Future<void> _onTapSubmitLogin() async {
    try {
      setState(() { _isLoading = true; });
      String email = _emailController.text;
      String password = _passwordController.text;
      final auth = Provider.of<AuthProvider>(context, listen: false);
      await auth.login(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Modal.alert(context, title: "Error", content: "${e.message}");
      setState(() { _isLoading = false; });
    } catch (e) {
      Log.debug("onTapSubmitLoginForm ${e.toString()}");
    }
  }

  Future<void> _onTapSubmitForgetPassword() async {
    try {
      setState(() { _isLoading = true; });
      String email = _emailController.text;
      final auth = Provider.of<AuthProvider>(context, listen: false);
      await auth.resetPassword(email: email);
    } on FirebaseAuthException catch (e) {
      Log.debug("onTapSubmitForgetPassword ${e.message}");
    } catch (e) {
      Log.debug("onTapSubmitForgetPassword ${e.toString()}");
    } finally {
      Modal.alert(
        context,
        title: "Success",
        content: "Success resetting your password, please check your email"
      ).then((_) => _reset());
    }
  }

  Widget _form(Size size) {
    if (_isRegisterScreen) {
      return RegisterForm(
        usernameController: _usernameController,
        emailController: _emailController,
        passwordController: _passwordController,
        passwordConfirmController: _passwordConfirmController,
        size: size,
        onTapLogin: _onTapLogin,
        onTapForgetPassword: _onTapForgetPassword,
        onTapSubmit: _isRegisterButtonDisabled ? null : _onTapSubmitRegister,
      );
    }

    if (_isForgetPasswordScreen) {
      return ForgetPasswordForm(
        emailController: _emailController,
        size: size,
        onTapLogin: _onTapLogin,
        onTapRegister: _onTapRegister,
        onTapSubmit: _isForgetPasswordButtonDisabled ? null : _onTapSubmitForgetPassword,
      );
    }

    return LoginForm(
      emailController: _emailController,
      passwordController: _passwordController,
      size: size,
      onTapRegister: _onTapRegister,
      onTapForgetPassword: _onTapForgetPassword,
      onTapSubmit: _isLoginButtonDisabled ? null : _onTapSubmitLogin,
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
              replacement: _form(size),
              child: const CircularProgressIndicator(color: Colors.grey)
            ),
          ),
        ),
      ),
    );
  }
}