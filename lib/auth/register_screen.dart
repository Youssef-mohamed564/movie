import 'package:flutter/material.dart';
import 'package:movie_app/auth/login_screen.dart';
import 'package:movie_app/common/app_assets.dart';

import '../common/app_colors.dart';
import '../screens/home_screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/reg';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visability = true;
  TextEditingController emailControler = TextEditingController();
  TextEditingController nameControler = TextEditingController();

  TextEditingController passControler = TextEditingController();
  TextEditingController repassControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.yellow,
              )),
          title: Row(
            children: [
              SizedBox(
                width: size.width * .23,
              ),
              const Text(
                'Register',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.yellow),
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Title
                  Image.asset(
                    AppAssets.registerPic,
                  ),
                  const SizedBox(height: 30),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                            controller: nameControler,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              fillColor: AppColor.grayColor,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          const SizedBox(height: 20),

                          TextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter email';
                              }
                              final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            controller: emailControler,
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
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Field
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter password!';
                              }
                              return null;
                            },
                            controller: passControler,
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
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter password!';
                              }
                              return null;
                            },
                            controller: repassControler,
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
                              labelText: 'Confirm Password',
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
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'please enter your phone number!';
                              }
                              return null;
                            },
                            controller :phoneControler,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              fillColor: AppColor.grayColor,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 30,
                              ),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          const SizedBox(height: 28),
                        ],
                      )),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                          backgroundColor:
                          const WidgetStatePropertyAll(AppColor.yellow)),
                      onPressed: () {
                      if(formKey.currentState?.validate()==true)
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                         {}
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      const Text(
                        "Already Have Account?",
                        style: TextStyle(color: AppColor.white, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      );

  }
}
