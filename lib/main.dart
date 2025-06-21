import 'package:flutter/material.dart';
import 'package:movie_app/auth/forget_pass.dart';
import 'package:movie_app/auth/login_screen.dart';
import 'package:movie_app/auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: {LoginScreen.routeName: (context) => LoginScreen(),
      RegisterScreen.routeName:(context)=>RegisterScreen(),
      ForgetPass.routeName:(context)=>ForgetPass()},
      title: ' Movie App',
    );
  }
}
