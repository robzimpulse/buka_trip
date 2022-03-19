import 'package:buka_trip/app/onboarding/landing.screen.dart';
import 'package:buka_trip/infrastructure/models/trip.model.dart';
import 'package:buka_trip/infrastructure/services/auth.service.dart';
import 'package:buka_trip/infrastructure/providers/index.dart';
import 'package:buka_trip/infrastructure/services/trip.service.dart';
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
    return MultiProvider(
      providers: <Provider>[
        Provider<AuthProvider>(create: (BuildContext context) => AuthService()),
        Provider<TripProvider>(create: (BuildContext context) => TripService()),
      ],
      child: const MaterialApp(
        title: 'Buka Trip',
        debugShowCheckedModeBanner: false,
        home: LandingScreen(),
      ),
    );
  }
}