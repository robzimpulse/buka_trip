import 'package:buka_trip/app/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../infrastructure/index.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // final User user = snapshot.data;
            // if (user == null) {
            //   return LoginPage();
            // }
            // return MyFlurryHomePage();
            Log.debug("testing active");
            return AuthScreen();
          }
          Log.debug("testing active 2");
          return AuthScreen();
        });
  }
}