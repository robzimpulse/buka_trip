import 'package:buka_trip/app/onboarding/landing.screen.dart';
import 'package:buka_trip/infrastructure/service/auth.service.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const BukaTripApp());
}

class BukaTripApp extends StatefulWidget {
  const BukaTripApp({Key? key}) : super(key: key);

  @override
  State<BukaTripApp> createState() => _BukaTripAppState();
}

class _BukaTripAppState extends State<BukaTripApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthProvider>(
      create: (BuildContext context) => AuthService(),
      child: const MaterialApp(
        title: 'Buka Trip',
        debugShowCheckedModeBanner: false,
        home: LandingScreen(),
      ),
    );
  }
}