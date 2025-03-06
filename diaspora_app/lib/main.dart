import 'package:diaspora_app/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'SplashPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

