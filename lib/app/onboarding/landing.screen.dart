import 'package:buka_trip/app/auth/auth.screen.dart';
import 'package:buka_trip/app/onboarding/splash.screen.dart';
import 'package:buka_trip/app/screens/root.screen.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const AuthScreen();
            }
            return const RootScreen();
          }
          return const SplashScreen();
        });
  }
}