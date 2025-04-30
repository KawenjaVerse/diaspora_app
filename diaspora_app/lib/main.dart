import 'package:diaspora_app/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:math' as math;

import 'SplashPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//ec83e20f-5f23-4e93-abf7-3a9fa57a9e41

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ec83e20f-5f23-4e93-abf7-3a9fa57a9e41");
  OneSignal.Notifications.requestPermission(true);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diaspora App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: '/', // Start with the splash screen route
      routes: {
        '/': (context) => const SplashPage(), // Splash page route
        '/home': (context) => const HomePage(), // Home page route
        //   '/signup': (context) => const _PlaceholderPage(title: 'Sign Up Page'), // Sign Up page route
        //   '/signin': (context) => const _PlaceholderPage(title: 'Sign In Page'), // Sign In page route
        //
      },
    );
  }
}
