import 'package:flutter/material.dart';

import '../common/app_assets.dart';
import '../common/app_colors.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});
  static const String routeName = '/forget';
  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                width: size.width * .16,
              ),
              const Text(
                'Forget Password',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.yellow),
              ),
            ],
          ),
        ),
        backgroundColor: AppColor.black,
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Login Title
                  Image.asset(
                    AppAsset.forgetPassPic,
                  ),
                  const SizedBox(height: 8),

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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                    ),
                  ),const SizedBox(height: 20,),
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
                          'Verify Email',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ])));
  }
}
