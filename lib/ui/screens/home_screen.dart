import 'package:flutter/material.dart';
import 'package:login_system_app/ui/custom/validators/validator.dart';
import 'package:login_system_app/utils/helpers/widget_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login System"),
      ),
      backgroundColor: const Color.fromARGB(255, 36, 110, 230),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  
            WidgetMethods.horizontalSpace(sizeOfScreen.width), // for givin column full width
            WidgetMethods.verticalSpace(80),
            Image.asset(
              "lib/assets/images/title_image.png",
              height: 60,
              width: 60, 
              color: Colors.white,
            ),
            WidgetMethods.verticalSpace(20),
            const FormWidget(),
            WidgetMethods.verticalSpace(20),
            // TODO: need to wrok on this part
            GestureDetector(
              onTap: () {debugPrint("Sign up with Twitter");},
              child: Container(
                width: sizeOfScreen.width * 0.65,
                color: const Color.fromARGB(255, 22, 138, 210),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: sizeOfScreen.width * 0.65,
                              child: const Text(
                                  "Sign up with Twitter",
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                            )
                          ],
                        ),
                      ),
                      Positioned( 
                        child: Image.network(
                            "https://pngset.com/images/download-white-twitter-twitter-logo-white-symbol-stomach-trademark-label-transparent-png-2497112.png",
                            height: 50,
                            width: 50,
                          ),
                        )
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
              controller: usernameController,
              validator: (String? value) => Validator.usernameValidator(value), 
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText: "Name", 
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true, 
                suffixIcon: const Icon(Icons.person), 
                suffixIconColor: Colors.white,
                fillColor: Colors.grey,
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
              controller: emailController,
              validator: (String? value) => Validator.emailValidator(value), 
              decoration: InputDecoration(  
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText: "Email", 
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                suffixIcon: const Icon(Icons.email_outlined), 
                suffixIconColor: Colors.white,
                fillColor: Colors.grey,
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
              controller: passwordController,
              validator: (String? value) => Validator.passwordValidator(value), 
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15), 
                hintText: "Password", 
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true, 
                suffixIcon: const Icon(Icons.lock_outline_rounded), 
                suffixIconColor: Colors.white,
                fillColor: Colors.grey,
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
              controller: confirmPasswordController,
              validator: (String? value) => Validator.confirmPasswordValidator(value, passwordController), 
              obscureText: true,
              decoration: InputDecoration( 
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                hintText: "Confirm password", 
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true, 
                suffixIcon: const Icon(Icons.lock_open_outlined), 
                suffixIconColor: Colors.white,
                fillColor: Colors.grey,
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
            SizedBox( 
              height: 50,
              width: sizeOfScreen.width * 0.65,
              child: ElevatedButton(
                onPressed: () { 
                  _formKey.currentState!.validate(); 
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white
                ), 
                child: const Center(
                  child: Text(
                    "SIGN UP", 
                    style: TextStyle( 
                      color: Color.fromARGB(255, 14, 105, 161),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                ),
              ),
            ),
            WidgetMethods.verticalSpace(5),
            SizedBox(
              width: sizeOfScreen.width * 0.65,
              child: const Center(
                child: Text.rich(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// child: Text("By signing up you agree to the Terms & Conditions",
//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Colors.white
//                   ),
//                 ),
