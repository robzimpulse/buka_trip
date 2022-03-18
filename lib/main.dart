import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'app/index.dart';
import 'infrastructure/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const BukaTripApp());
}

class BukaTripApp extends StatelessWidget {
  const BukaTripApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => AuthService(),
      child: const MaterialApp(
        title: 'Buka Trip',
        debugShowCheckedModeBanner: false,
        home: LandingScreen(),
      ),
    );
  }

}