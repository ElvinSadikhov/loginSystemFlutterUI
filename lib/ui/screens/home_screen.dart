import 'package:flutter/material.dart';
import 'package:login_system_app/consts/color_consts.dart';
import 'package:login_system_app/consts/text_consts.dart'; 
import 'package:login_system_app/ui/widgets/form_widget.dart';
import 'package:login_system_app/utils/helpers/widget_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;
    double width = sizeOfScreen.width * 0.65;

    return Scaffold(
      appBar: AppBar(
        title: TextConsts.loginSystem,
      ),
      backgroundColor: ColorConsts.screenBackground ,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  
            WidgetMethods.horizontalSpace(sizeOfScreen.width), // for givin column full width
            WidgetMethods.verticalSpace(60),
            Image.asset(
              "lib/assets/images/title_image.png",
              height: 60,
              width: 60, 
              color: ColorConsts.white,
            ),
            WidgetMethods.verticalSpace(20),
            const FormWidget(),
            WidgetMethods.verticalSpace(20), 
            GestureDetector(
              onTap: () { debugPrint("Sign up with Twitter"); },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: width,
                   color: ColorConsts.signUpTwitterBackground ,
                  child: SizedBox(
                    width: width,
                    height: 50,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "lib/assets/images/twitter_icon.png",
                            height: 20,
                            width: 20,
                          ),
                          TextConsts.signUpTwitter,
                          WidgetMethods.horizontalSpace(10)
                        ],
                      ),
                    ),
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

