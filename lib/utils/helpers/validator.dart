import 'package:flutter/material.dart';

class Validator {

  Validator._();

  static String? username(String? value) { 
    return value == null || value.isEmpty ? "Please enter a username!" :   
        value.length < 8 ? "Username must be at least 8 characters!" : 
          !value.contains(RegExp(r'[A-Z]')) && !value.contains(RegExp(r'[a-z]')) 
            ? "Username must have at least 1 letter!" : null;
  }  

  static String? email(String? value) {
    return value == null || value.isEmpty ? "Please enter an email address!" :
      !value.contains("@gmail.com") ? "Please enter valid gmail!" : null;
  }

  static String? password(String? value) {
    return value == null || value.isEmpty ? "Please enter a password!" :   
        value.length < 10 ? "Password must be at least 10 characters!" : 
          value == value.toLowerCase() || value == value.toUpperCase() 
            ? "Your password must contain both lowercase and uppercase characters!" : null;
  } 

  static String? confirmPassword(String? value, TextEditingController controller) {
    return value == null || value.isEmpty ? "Please enter a password second time!" :
      value != controller.value.text.trim() ? "Passwords don't match!" : null;
  }
  
}