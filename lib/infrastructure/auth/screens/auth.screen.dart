import 'dart:async';
import 'dart:math';

import 'package:buka_trip/infrastructure/auth/index.dart';
import 'package:buka_trip/infrastructure/util/index.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {

  Duration duration = const Duration(seconds: 5);
  Timer? _timer;
  List<String> backgrounds = [
    'assets/images/sunset_background_image.jpeg',
    'assets/images/beach_background_image.jpeg'
  ];
  String background = "";
  final _random = Random();
  bool isRegisterScreen = false;
  bool isLoading = false;

  void changeBackground() {
    String newbg = backgrounds.elementAt(_random.nextInt(backgrounds.length));
    if (background != newbg) {
      setState(() { background = newbg; });
      Log.debug("changed background to $background");
    }
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    } else {
      changeBackground();
      _timer = Timer.periodic(duration, (timer) { changeBackground(); });
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
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
              visible: isRegisterScreen,
              replacement: LoginForm(size: size),
              child: RegisterForm(size: size)
                // child:
            ),
          ),
        ),
      ),
    );
  }
}