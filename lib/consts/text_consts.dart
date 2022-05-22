import 'package:flutter/material.dart';

class TextConsts {
  static const String name = "Name";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm password";
  
  static const Text signUpWidget = Text(
                "SIGN UP", 
                style: TextStyle( 
                  color: Color.fromARGB(255, 14, 105, 161),
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ), 
              );
  static const Text checkingWidget = Text(
                  "Checking...",
                  style: TextStyle( 
                    color: Color.fromARGB(255, 14, 105, 161),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                );
  static const Text termsWidget = Text.rich(
                  TextSpan(
                    text: "By signing up you agree to the ",
                    style: TextStyle(
                      fontSize: 11, 
                      color: Colors.white
                    ),
                    children: [
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                          fontSize: 11, 
                          color: Colors.white
                          , decoration: TextDecoration.underline
                        ),
                      )
                    ]
                  )
                );
  static const Text signUpTwitterWidget = Text(
                            "Sign up with Twitter",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                            ),
                          );
  static const Text loginSystemWidget = Text("Login System");
}