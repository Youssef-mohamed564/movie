import 'package:flutter/material.dart';
import 'package:movie_app/auth/forget_pass.dart';
import 'package:movie_app/auth/login_screen.dart';
import 'package:movie_app/auth/register_screen.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';

import 'on boarding/onboarding_screen.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgetPass.routeName: (context) => ForgetPass(),
        HomeScreen.routeName:(context)=>HomeScreen(),

      },
      title: ' Movie App',
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      body: Center(
        child: Image.asset('assets/images/movies icon.png', width: 150),
      ),
    );
  }
}
