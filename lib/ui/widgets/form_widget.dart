// ignore_for_file: unnecessary_this

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:login_system_app/consts/string_consts.dart';
import 'package:login_system_app/consts/text_consts.dart';
import 'package:login_system_app/ui/custom/validators/validator.dart';
import 'package:login_system_app/utils/helpers/widget_methods.dart';


class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(); 
  final TextEditingController confirmPasswordController = TextEditingController();

  final hintColor = Colors.white38;

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SizedBox(
        width: sizeOfScreen.width * 0.65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            TextFormField( 
              textInputAction: TextInputAction.next,
              controller: usernameController,
              validator: (String? value) => Validator.username(value), 
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText: StringConsts.name, 
                hintStyle: TextStyle(color: this.hintColor),
                filled: true, 
                suffixIcon: const Icon(Icons.person), 
                suffixIconColor: Colors.white,
                fillColor: const Color.fromARGB(139, 66, 68, 89),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 12, 174, 233))
                ),  
              ),
            ),
            WidgetMethods.verticalSpace(5),
            TextFormField(  
              textInputAction: TextInputAction.next,
              controller: emailController,
              validator: (String? value) => Validator.email(value), 
              decoration: InputDecoration(  
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText: StringConsts.email, 
                hintStyle: TextStyle(color: this.hintColor),
                filled: true,
                suffixIcon: const Icon(Icons.email_outlined), 
                suffixIconColor: Colors.white,
                fillColor: const Color.fromARGB(139, 66, 68, 89),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 12, 174, 233))
                ),  
              ),
            ),
            WidgetMethods.verticalSpace(5),
            TextFormField(  
              textInputAction: TextInputAction.next,
              controller: passwordController,
              validator: (String? value) => Validator.password(value), 
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15), 
                hintText: StringConsts.password, 
                hintStyle: TextStyle(color: this.hintColor),
                filled: true, 
                suffixIcon: const Icon(Icons.lock_outline_rounded), 
                suffixIconColor: Colors.white,
                fillColor: const Color.fromARGB(139, 66, 68, 89),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 12, 174, 233))
                ),  
              ),
            ),
            WidgetMethods.verticalSpace(5),
            TextFormField(   
              textInputAction: TextInputAction.done,
              controller: confirmPasswordController,
              validator: (String? value) => Validator.confirmPassword(value, passwordController), 
              obscureText: true,
              decoration: InputDecoration( 
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText:StringConsts.confirmPassword, 
                hintStyle: TextStyle(color: this.hintColor),
                filled: true, 
                suffixIcon: const Icon(Icons.lock_open_outlined), 
                suffixIconColor: Colors.white,
                fillColor: const Color.fromARGB(139, 66, 68, 89),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 12, 174, 233))
                ),  
              ),
            ),
            WidgetMethods.verticalSpace(5),
            ArgonTimerButton(
              height: 50, 
              width: sizeOfScreen.width * 0.65, 
              minWidth: sizeOfScreen.width * 0.30,
              highlightColor: Colors.transparent,  
              onTap: (startTimer, buttonState) async {
                if (buttonState == ButtonState.Idle) {
                  startTimer(3);
                  await Future.delayed(const Duration(seconds: 3));
                } 
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You successfully signed up!")));
                  debugPrint("${usernameController.text.trim()}, ${emailController.text.trim()}, ${passwordController.text.trim()}, ${confirmPasswordController.text.trim()}");
                }  
              }, 
              child: TextConsts.signUp,
              loader: (timeLeft) {
                return TextConsts.checking; 
              },
              borderRadius: 5,
              color: Colors.white,
              elevation: 0, 
            ),
            // SizedBox( 
            //   height: 50,
            //   width: sizeOfScreen.width * 0.65,
            //   child: ElevatedButton(
            //     onPressed: () { 
            //       if (_formKey.currentState!.validate()) {
            //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You successfully signed up!")));
            //         debugPrint("${usernameController.text.trim()}, ${emailController.text.trim()}, ${passwordController.text.trim()}, ${confirmPasswordController.text.trim()}"); 
            //       } 
            //     },
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.white
            //     ), 
            //     child: const Center(
            //       child: Text(
            //         "SIGN UP", 
            //         style: TextStyle( 
            //           color: Color.fromARGB(255, 14, 105, 161),
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold
            //         ), 
            //       ),
            //     ),
            //   ),
            // ),
            WidgetMethods.verticalSpace(5),
            SizedBox(
              width: sizeOfScreen.width * 0.65,
              child: const Center(
                child: TextConsts.terms 
              ),
            ),  
          ],
        ),
      ),
    );
  }
}


 