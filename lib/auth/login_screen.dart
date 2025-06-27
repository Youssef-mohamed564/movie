import 'package:flutter/material.dart';
import 'package:movie_app/auth/forget_pass.dart';
import 'package:movie_app/auth/register_screen.dart';
import 'package:movie_app/common/app_assets.dart';

import '../common/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _CleanLoginScreenState();
}

class _CleanLoginScreenState extends State<LoginScreen> {
  bool visability = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 50),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login Title
                Image.asset(
                  AppAssets.appLogo,
                  width: 121,
                ),
                const SizedBox(height: 40),

                // Email Field
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    fillColor: AppColor.grayColor,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 30,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: visability,
                  decoration: InputDecoration(
                    fillColor: AppColor.grayColor,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 30,
                    ),
                    labelText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            visability == true
                                ? visability = false
                                : visability = true;
                          });
                        },
                        child: Icon(
                          visability == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        )),
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                const SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ForgetPass.routeName);
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            const WidgetStatePropertyAll(AppColor.yellow)),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(
                      width: 60,
                    ),
                    const Text(
                      "Don't Have Account?",
                      style: TextStyle(color: AppColor.white, fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: const Text(
                        " Create One",
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                  ],
                )
                // Sign Up Prompt

                ,
                const SizedBox(height: 16),

                // OR Divider
                const Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: AppColor.yellow,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: AppColor.yellow,
                    )),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            const WidgetStatePropertyAll(Size.fromHeight(50)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            const WidgetStatePropertyAll(AppColor.yellow)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.googleIcon,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Login With Google',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColor.black),
                        ),
                      ],
                    )),
                // Google Login Button
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
