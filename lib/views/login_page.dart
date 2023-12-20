// import 'dart:math';

import 'package:call_doc/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                "Login",
                style:
                    GoogleFonts.sora(fontSize: 40, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Email cannot be empty" : null,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (value) => value!.length < 8
                      ? "Passowrd should have at least 8 characters."
                      : null,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AuthService()
                            .loginWithEmail(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value == "Login Successful") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Login Successful")));
                            Navigator.pushReplacementNamed(context, "/home");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                value,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red.shade400,
                            ));
                          }
                        });
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: OutlinedButton(
                    onPressed: () {
                      AuthService().continueWithGoogle().then((value) {
                        if (value == "Google Login Successful") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Google Login Successful")));
                          Navigator.pushReplacementNamed(context, "/home");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              value,
                              style: TextStyle(color: Colors.red.shade400),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ));
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text("Sign Up"))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: OutlinedButton(
                    onPressed: () {
                      AuthService().continueWithKakao();
                      // Navigator.pushReplacementNamed(context, "/home");
                      //tab index로 nav
                      Navigator.pushReplacementNamed(context, "/tabindex");

                      // AuthService().continueWithGoogle().then((value) {
                      //   if (value == "Google Login Successful") {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             content: Text("Google Login Successful")));
                      //     Navigator.pushReplacementNamed(context, "/home");
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //       content: Text(
                      //         value,
                      //         style: TextStyle(color: Colors.red.shade400),
                      //       ),
                      //       backgroundColor: Colors.red.shade400,
                      //     ));
                      //   }
                      // });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.maps_ugc),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Continue with KakaoTalk",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
