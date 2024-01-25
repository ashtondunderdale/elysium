import 'package:elysium/views/notes.dart';
import 'package:elysium/views/register.dart';
import 'package:flutter/material.dart';

import '../services/login_service.dart';
import '../utils/styles.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 96),
            child: Text(
              "Elysium",
              style: Styles.elysiumTitleStyle,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 128),
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Login",
                        style: Styles.loginHintStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextField(
                        cursorColor: Styles.mediumGrey,
                        controller: emailController,
                        decoration: Styles.loginDecoration.copyWith(
                          hintText: "email",
                          hintStyle: Styles.loginHintStyle,
                        ),
                        style: Styles.loginHintStyle,
                      ),
                    ),
                    TextField(
                      cursorColor: Styles.mediumGrey,
                      controller: passwordController,
                      obscureText: true,
                      decoration: Styles.loginDecoration.copyWith(
                        hintText: "password",
                        hintStyle: Styles.loginHintStyle,
                      ),
                      style: Styles.loginHintStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: IconButton(
                        onPressed: () {
                            var elysiumUser = LoginService.tryLogin(emailController.text, passwordController.text);
                              
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Notes(elysiumUser: elysiumUser,)));
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Styles.lightGrey,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 128),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: Text(
                          "Or Register here",
                          style: Styles.loginHintStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}