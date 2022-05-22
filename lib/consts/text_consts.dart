import 'package:flutter/material.dart';

class TextConsts {

  TextConsts._();
  
  static const Text signUp = Text(
                "SIGN UP", 
                style: TextStyle( 
                  color: Color.fromARGB(255, 14, 105, 161),
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ), 
              );
  static const Text checking = Text(
                  "Checking...",
                  style: TextStyle( 
                    color: Color.fromARGB(255, 14, 105, 161),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                );
  static const Text terms = Text.rich(
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
  static const Text signUpTwitter = Text(
                            "Sign up with Twitter",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                            ),
                          );
  static const Text loginSystem = Text("Login System");
}